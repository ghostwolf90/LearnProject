//
//  BleManager.swift
//  QLiEERPhoenix
//
//  Created by PocaChen on 2018/10/16.
//  Copyright © 2018 QLIEER. All rights reserved.
//

import Foundation
import CoreBluetooth


protocol BleManagerDelegate:class {
    func didDiscoverBleDevice(peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber)
    func bleDeviceDidUpdateValue(resultString:String)
    //使用ble務必等到CBManagerState == .poweredOn 才能啟用相關Ble方法
    func bleCentralManagerDidUpdateState()
    func bleDeviceDidConnect(bleDevice:CBPeripheral)
    func bleDeviceDidFailToConnect(bleDevice:CBPeripheral)
    func bleStartConnect()
    func bleConnectTimeOutFail() //bleDevice可能會有無回應狀況，手動控制timeOut
}

extension BleManagerDelegate{
    func didDiscoverBleDevice(peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber){}
    func bleDeviceDidUpdateValue(resultString:String){}
    func bleCentralManagerDidUpdateState(){}
    func bleDeviceDidConnect(bleDevice:CBPeripheral){}
    func bleDeviceDidFailToConnect(bleDevice:CBPeripheral){}
    func bleStartConnect(){}
    func bleConnectTimeOutFail(){}
}

class BleManager:NSObject{
    static var sharedInstance = BleManager()
    var selectedDevicesList = [CBPeripheral]()
    weak var delegate : BleManagerDelegate?
    var manager: CBCentralManager!
    var managerState = CBManagerState.unknown
    var connectTimeOut : Timer?
    
    let electronicScaleServiceUUID = "E7810A71-73AE-499D-8C15-FAA9AEF0C3F2" //BLE重量服務
    fileprivate let electronicScaleCharacterUUID = "BEF8D6C9-9C21-4C9E-B632-BD58C1009F9F" //BLE重量屬性
    
    private override init() {
        super.init()
        manager = CBCentralManager(delegate: self, queue: DispatchQueue.main)
    }
    
    //若bleDevice被其他app連走，或者沒開機，bleDevice.state會一直呈現connecting直到設備回應
    //故設定3秒等待，超過就斷線設備，避免沒有回應
    func createConnectTimer(){
         connectTimeOut = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(notifyTimeOut), userInfo: nil, repeats: false)
    }
    
    func stopConnectTimer(){
        connectTimeOut?.invalidate()
        connectTimeOut = nil
    }
    
    @objc func notifyTimeOut(){
        delegate?.bleConnectTimeOutFail()
    }
    
    //掃描
    func startScanBleDevice(){        
        guard managerState == .poweredOn else {
            return
        }
        let option = [CBCentralManagerScanOptionAllowDuplicatesKey : false]
        manager.scanForPeripherals(withServices: nil, options: option)
    }
    
    func stopScanBleDevice(){
        manager.stopScan()
    }
    
    //連線
    func connectBleDevice(bleDevice:CBPeripheral){
        guard managerState == .poweredOn else {return}
        delegate?.bleStartConnect()
        createConnectTimer()
        manager.connect(bleDevice, options: nil)
    }
    
    //斷線
    func disConnectBleDevice(bleDevice:CBPeripheral){
        manager.cancelPeripheralConnection(bleDevice)
        if let index = selectedDevicesList.firstIndex(of: bleDevice){
            selectedDevicesList.remove(at: index)
        }
        stopConnectTimer()
    }
    
    func disConnectAllBleDevice(){
        for bleDevice in selectedDevicesList{
            manager.cancelPeripheralConnection(bleDevice)
        }
        selectedDevicesList.removeAll()
    }
    
    ///透過uuid搜尋藍牙設備，會找到曾經連線過的設備
    func searchBleDeviceByUuid(uuid:String) -> CBPeripheral?{
        let uuid = UUID(uuidString: uuid)
        let devices = manager.retrievePeripherals(withIdentifiers: [uuid!])
        if let device = devices.first{
            return device
        }else{
            return nil
        }
    }
    
    ///自動檢查重新連線機制
    func autoConnectBleDivice(uuid:String){
        if let bleDevice = searchBleDeviceByUuid(uuid: uuid){
            //有連線就直接廣播啟用服務
            if bleDevice.state == .connected {
                discoverServices(bleDevice: bleDevice)
            }else{
                if let oldBle = selectedDevicesList.first(where: {$0.identifier == bleDevice.identifier}){
                    connectBleDevice(bleDevice: oldBle)
                }else{
                    //若selectedDevicesList空，連線前要先append持有物件，connect才有效，不然會沒回應
                    selectedDevicesList.append(bleDevice)
                    connectBleDevice(bleDevice: bleDevice)
                }
            }
        }
    }
    
    
    //找尋可用的服務
    func discoverServices(bleDevice:CBPeripheral){
        bleDevice.discoverServices(nil)
    }
    
    //開關Characteristic通知
    func enableBleCharacteristic(bleDevice:CBPeripheral, setNotifyValue:Bool, serviceUUIDString:String){
        guard let services = bleDevice.services else {return}
        
        for service in services {
            if service.uuid.uuidString == serviceUUIDString  {
                for characteristic in service.characteristics!{
                    bleDevice.setNotifyValue(setNotifyValue, for: characteristic)
                }
            }
        }
    }
        
        
}



extension BleManager: CBCentralManagerDelegate, CBPeripheralDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        managerState = central.state
        delegate?.bleCentralManagerDidUpdateState()
    }
    
     func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {                        
        delegate?.didDiscoverBleDevice(peripheral: peripheral, advertisementData: advertisementData, rssi: RSSI)
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("\(peripheral.name!):藍牙連線成功")
        stopConnectTimer()
        peripheral.delegate = self
        //delegate?.bleDeviceDidConnect(bleDevice: peripheral)
        manager.stopScan()
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        guard let services = peripheral.services else {return}
        
        for service in services {
            print("service.uuid.uuidString:\(service.uuid.uuidString)")
            //目前只有電子秤需要找尋service
            if service.uuid.uuidString == electronicScaleServiceUUID  {
                peripheral.discoverCharacteristics(nil, for: service)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        guard let characteristics = service.characteristics else { return }
        for character in characteristics {
            if character.uuid.uuidString == electronicScaleCharacterUUID {
                peripheral.setNotifyValue(true, for: character)
            }

        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?) {
        print("didUpdateNotificationStateFor")
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        let string = String(data: characteristic.value!, encoding: .ascii)
        let f = string!.dropFirst()
        let l = f.dropLast(2)
        
        delegate?.bleDeviceDidUpdateValue(resultString: String(l))
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        print("\(peripheral.name!):藍牙連線失敗")
        stopConnectTimer()
        delegate?.bleDeviceDidFailToConnect(bleDevice: peripheral)
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        print("\(peripheral.name!):藍牙已斷線")
    }
}

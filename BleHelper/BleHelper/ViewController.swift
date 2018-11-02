//
//  ViewController.swift
//  BleHelper
//
//  Created by Laibit on 2018/10/24.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var discoveredPeripherals = [CBPeripheral]()
    var bleManager = BleManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bleManager.delegate = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discoveredPeripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = discoveredPeripherals[indexPath.row].name 
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bleDevice = discoveredPeripherals[indexPath.row]
        bleManager.connectBleDevice(bleDevice: bleDevice)
    }
    
}

extension ViewController: BleManagerDelegate{
    
    func bleCentralManagerDidUpdateState() {
        //bleManager第一次init時才會執行
        bleManager.startScanBleDevice()
    }
    
    //廣播開始時，找到設備會一直得到回應
    func didDiscoverBleDevice(peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let peripheralName = peripheral.name
        guard peripheralName != nil else {
            return
        }
        
        var isExisted = false
        for aPeripheral in discoveredPeripherals {
            if (aPeripheral.identifier == peripheral.identifier){
                isExisted = true
            }
        }
        
        if !isExisted{
            print(peripheralName)
            discoveredPeripherals.append(peripheral)
            tableView.reloadData()
        }
    }
    
    
    func bleDeviceDidConnect(bleDevice: CBPeripheral) {
        print("BLE連線成功")
    }
    
    func bleDeviceDidFailToConnect(bleDevice: CBPeripheral) {
        print("BLE連線失敗")
    }
}


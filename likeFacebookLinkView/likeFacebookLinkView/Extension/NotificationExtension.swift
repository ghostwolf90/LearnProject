//
//  NotificationExtension.swift
//  QLiEERPhoenix
//
//  Created by florachen on 2018/1/13.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let updateOrder = Notification.Name("updateOrder")
    static let closeOrders = Notification.Name("closeOrders")
    static let updateProducts = Notification.Name("updateProducts")
    static let checkoutDone = Notification.Name("checkoutDone")
    //pendingOrder結帳完成
    static let pendingOrderCheckoutDone = Notification.Name("pendingOrderCheckoutDone")
    static let mobileOrderChangeToDoingState = Notification.Name("mobileOrderChangeToDoingState")
    static let mobileOrderChangeToAwaitState = Notification.Name("mobileOrderChangeToAwaitState")
    static let mobileOrderChangeToCompleteState = Notification.Name("mobileOrderChangeToCompleteState")
    static let updateSettingTableview = Notification.Name("updateSettingTableview")
}

//
//  Log.swift
//  Core
//
//  Created by Piotr Fraccaro on 21/03/2021.
//

import Foundation

public enum LogIcon: String {
    case save = "[đž]"
    case push = "[đ˛]"
    case networkRequest = "[đ] [â]"
    case networkResponse = "[đ] [â]"
    case userDefaults = "[đ]"
    case keychain = "[đ]"
    case event = "[đ]"
    case debug = "[âī¸]"
    case info = "[âšī¸]"
    case success = "[â]"
    case warning = "[â ī¸]"
    case error = "[â]"
}

public func log(_ icon: LogIcon, _ args: Any) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm:ss.SSS"
    print("\(dateFormatter.string(from: Date())) \(icon.rawValue) \(args)")
}

//
//  RemoteNotificationsHandler.swift
//  PafipiMDM
//
//  Created by Piotr Fraccaro on 04/06/2021.
//

import UIKit
import Core

protocol RemoteNotificationsHandler {
    
    var delegate: RemoteNotificationsHandlerDelegate? { get set }
    
    func didReceiveNotification(with userInfo: [AnyHashable: Any])
}

protocol RemoteNotificationsHandlerDelegate: AnyObject {
    
    func shouldShowMobileConfigInstallScene()
}

final class RemoteNotificationsHandlerImpl: RemoteNotificationsHandler {
    
    weak var delegate: RemoteNotificationsHandlerDelegate?
    
    func didReceiveNotification(with userInfo: [AnyHashable: Any]) {
        log(.push, "Did receive remote notificataion")
        guard let aps = userInfo["aps"] as? [String: AnyObject] else { return }
        
        if let alert = aps["alert"] as? String {
            if alert == Constants.enrollmentFinishedAlert {
                log(.push, "Did receive mobile config installation push")
                delegate?.shouldShowMobileConfigInstallScene()
            }
        }
    }
}

private struct Constants {
    
    static let enrollmentFinishedAlert = "Enrollment finished!"
}

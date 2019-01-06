//
//  NotificationManager.swift
//  Tasks
//
//  Created by Yarr!zzeR on 27/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//
import UIKit
import UserNotifications

class Notifications: NSObject {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func requestAuthorization() {
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge], completionHandler: { (granted, error) in
            print("Permission granted \(granted)")
            guard granted else { return }
            self.getNotificationSettings()
        })
    }
    
    func getNotificationSettings() {
        notificationCenter.getNotificationSettings { (settings) in
            print("User notification settings \(settings)")
        }
    }
    
    
    func scheduleNotification(forTask _task_:Task) {
        guard let dueMoment = _task_.dueDate, dueMoment.timeIntervalSinceNow > 0 else { return }

        let content = UNMutableNotificationContent()
        let userAction = "User action"
            
        content.title = _task_.taskTitle
        content.body = _task_.taskDescription
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = userAction
        
//        if let path = Bundle.main.path(forResource: "\(_task_.listRelationship.imageName)-iphone", ofType: "png") {
//            print(_task_.listRelationship.imageName)
//            let url = URL(fileURLWithPath: path)
//            do {
//                let attachment = try UNNotificationAttachment(identifier: "Attachment", url: url, options: nil)
//                content.attachments = [attachment]
//            } catch {
//                print("Attachment could not be loaded")
//            }
//        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: dueMoment.timeIntervalSinceNow, repeats: false)
        
        let identifier = "\(_task_.objectID.uriRepresentation().absoluteString)"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            print(String(describing: error?.localizedDescription))
        }
        
        let snoozeActionInTenMinutes = UNNotificationAction(identifier: "\(identifier)#SnoozeTenMinutes", title: "Snooze for 10 minutes", options: [])
        
        let snoozeActionForHour = UNNotificationAction(identifier: "\(identifier)#SnoozeHour", title: "Snooze for 1 hour", options: [])
        
        let snoozeActionForDay = UNNotificationAction(identifier: "\(identifier)#SnoozeDay", title: "Snooze for 1 day", options: [])
        
        let setCompleteAction = UNNotificationAction(identifier: "\(identifier)#SetComplete", title: "Set mark 'Complete'", options: [.destructive])
        
        let category = UNNotificationCategory(identifier: userAction, actions: [snoozeActionInTenMinutes, snoozeActionForHour, snoozeActionForDay, setCompleteAction], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
    }
    
    func removeNotifications(forTask _task_: Task) {
        let identifier = "\(_task_.objectID.uriRepresentation().absoluteString)"
        let snoozeTenMinutesIdentifier = "\(identifier)#SnoozeTenMinutes"
        let snoozeHourIdentifier = "\(identifier)#SnoozeHour"
        let snoozeDayIdentifier = "\(identifier)#SnoozeDay"
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier, snoozeTenMinutesIdentifier, snoozeHourIdentifier, snoozeDayIdentifier])
    }
}

extension Notifications: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case UNNotificationDismissActionIdentifier: print("Action dismissed")
        case UNNotificationDefaultActionIdentifier: print("Default")
        case "\(response.notification.request.identifier)#SnoozeTenMinutes":
            guard let _task_ = MainDatabaseManager.shared.getTask(withId:
                response.notification.request.identifier) else { return }
            let newNotificationMoment = (_task_.dueDate as Date?)?.addingTimeInterval(600)
            let demands = TaskDemands(forList: _task_.listRelationship, forTask: _task_, withTitle: _task_.taskTitle, withDescription: _task_.taskDescription, taskCompleted: _task_.completed, completionDate: _task_.completionDate as Date?, importance: Int(_task_.importance), predeletionState: _task_.predeletionState, dueDate: newNotificationMoment)
            MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
            scheduleNotification(forTask: _task_)
        case "\(response.notification.request.identifier)#SnoozeHour":
            guard let _task_ = MainDatabaseManager.shared.getTask(withId:
                response.notification.request.identifier) else { return }
            let newNotificationMoment = (_task_.dueDate as Date?)?.addingTimeInterval(3600)
            let demands = TaskDemands(forList: _task_.listRelationship, forTask: _task_, withTitle: _task_.taskTitle, withDescription: _task_.taskDescription, taskCompleted: _task_.completed, completionDate: _task_.completionDate as Date?, importance: Int(_task_.importance), predeletionState: _task_.predeletionState, dueDate: newNotificationMoment)
            MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
            scheduleNotification(forTask: _task_)
        case "\(response.notification.request.identifier)#SnoozeDay":
            guard let _task_ = MainDatabaseManager.shared.getTask(withId:
                response.notification.request.identifier) else { return }
            let newNotificationMoment = (_task_.dueDate as Date?)?.addingTimeInterval(86400)
            let demands = TaskDemands(forList: _task_.listRelationship, forTask: _task_, withTitle: _task_.taskTitle, withDescription: _task_.taskDescription, taskCompleted: _task_.completed, completionDate: _task_.completionDate as Date?, importance: Int(_task_.importance), predeletionState: _task_.predeletionState, dueDate: newNotificationMoment)
            MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
            scheduleNotification(forTask: _task_)
        case "\(response.notification.request.identifier)#SetComplete":
            guard let _task_ = MainDatabaseManager.shared.getTask(withId:
                response.notification.request.identifier) else { return }
            let demands = TaskDemands(forList: _task_.listRelationship, forTask: _task_, withTitle: _task_.taskTitle, withDescription: _task_.taskDescription, taskCompleted: true, completionDate: _task_.completionDate as Date?, importance: Int(_task_.importance), predeletionState: _task_.predeletionState, dueDate: _task_.dueDate as Date?)
            MainDatabaseManager.shared.performATaskRecord(withDemends: demands)
            removeNotifications(forTask: _task_)
        default: print("Unknown action")
        }
        
        completionHandler()
    }
}

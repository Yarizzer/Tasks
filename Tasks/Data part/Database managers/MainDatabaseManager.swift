//
//  MainDatabaseManager.swift
//  Tasks
//
//  Created by Yarr!zzeR on 02/10/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation

class MainDatabaseManager {
    static let shared = MainDatabaseManager()
    private init() {}
    //MARK: - Main group section
    //MARK: - supporting section
    
    func getPreferredList() -> List? {
        return ListDatabaseManager.shared.getPreferredList()
    }
    
    func getListsFromDatabase() -> [List] {
        return ListDatabaseManager.shared.getLists()
    }
    
    func getTasksFromDatabase() -> [Task] {
        return TaskDatabaseManager.shared.getTasks()
    }
    
    func getTasks(forList _list_: List) -> [Task] {
        return TaskDatabaseManager.shared.getTasks(forList: _list_)
    }
    
    //MARK: - creation section
    
    func performAListRecord(withDemends _demands_: ListDemands) {
        let _ = ListDatabaseManager.shared.performARecordForAList(withDemands: _demands_)
        
    }
    
    func performATaskRecord(withDemends _demands_: TaskDemands) {
        TaskDatabaseManager.shared.performARecordForATask(withDemands: _demands_)
    }
    
    //MARK: - changing record proreties
    
    func changePreferredList(forList _list_: List) {
        ListDatabaseManager.shared.changePreferredList(forList: _list_)
    }
    
    //MARK: - detetion section
    
//    func removePredeletedRecords() {
//        TaskDatabaseManager.shared.removePredeletedRecordsFromDatabase()
//    }
    
    func removeListRecordFromDatabase(forObject _listObject_: List) {
        ListDatabaseManager.shared.removeListRecordFromDatabase(forList: _listObject_)
    }
    
    func removeTaskRecordFromDatabase(forObject _taskObject_: Task) {
        TaskDatabaseManager.shared.removeTaskRecordFromDatabase(forTask: _taskObject_)
    }
    
    //MARK: - Trash group section
    
    func getPredeletedTasksFromDataBase() -> [Task] {
        return TaskDatabaseManager.shared.getPredeletedTasks()
    }
    
    //MARK: - notification section
    
    func getTask(withId _id_: String) -> Task? {
        return TaskDatabaseManager.shared.getTask(withId: _id_)
    }
}

//
//  TaskViewModel.swift
//  task-manager
//
//  Created by nguyen.van.thuanc on 18/11/2022.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
    @Published var currentTab: String = "Today"
    
    // MARK: New Task Properties
    @Published var openEditTask: Bool = false
    @Published var taskTitle: String = ""
    @Published var taskColor: String = "Yellow"
    @Published var taskDeadline: Date = Date()
    @Published var taskType: String = "Basic"
    @Published var showDatePicker: Bool = false
    
    // MARK: Editting Task
    @Published var editTask: Task?
    
    // MARK: Adding Task To Core Data
    func addTask(context: NSManagedObjectContext) -> Bool {
        var task: Task?
        
        if let editTask = editTask {
            task = editTask
        } else {
            task = Task(context: context)
        }
        
        guard let task = task else { return false }
        
        task.title = taskTitle
        task.color = taskColor
        task.deadline = taskDeadline
        task.type = taskType
        task.isCompleted = false
        
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetTaskData() {
        taskTitle = "Basic"
        taskColor = "Yellow"
        taskTitle = ""
        taskDeadline = Date()
    }
    
    // MARK: If Editing Task Is Available then Setting Existing Data
    func setupTask() {
        taskTitle = editTask?.title ?? ""
        taskColor = editTask?.color ?? "Yellow"
        taskType =  editTask?.type ?? "Bassic"
        taskDeadline = editTask?.deadline ?? Date()
    }
}

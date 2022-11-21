//
//  task_managerApp.swift
//  task-manager
//
//  Created by nguyen.van.thuanc on 18/11/2022.
// https://www.youtube.com/watch?v=x8h6hTqo2So&t=310s = 23:11

import SwiftUI

@main
struct task_managerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

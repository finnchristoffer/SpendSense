//
//  SpendSenseApp.swift
//  SpendSense
//
//  Created by Finn Christoffer on 09/02/26.
//

import SwiftUI
import CoreData

@main
struct SpendSenseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

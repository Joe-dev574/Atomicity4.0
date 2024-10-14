//
//  Atomicity4_0App.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/12/24.
//

import SwiftUI
import SwiftData

@main
struct Atomicity4_0App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Objective.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabBarHome()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .modelContainer(sharedModelContainer)
    }
}

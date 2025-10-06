//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Saurabh Sawla on 06/10/25.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

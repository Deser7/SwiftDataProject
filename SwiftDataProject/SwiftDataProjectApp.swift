//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Наташа Спиридонова on 08.08.2025.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}

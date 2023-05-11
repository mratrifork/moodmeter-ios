//
//  MoodMeterApp.swift
//  MoodMeter
//
//  Created by Martin Rasmussen on 10/05/2023.
//

import SwiftUI

@main
struct MoodMeterApp: App {
    @StateObject var stressLevelRepository: DefaultStressLevelRepository = DefaultStressLevelRepository()

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(stressLevelRepository)
        }
    }
}

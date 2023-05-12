//
//  MoodMeterApp.swift
//  MoodMeter
//
//  Created by Martin Rasmussen on 10/05/2023.
//

import SwiftUI

@main
struct MoodMeterApp: App {
    @StateObject var stressLevelViewModel: StressLevelViewModel = StressLevelViewModel(repository: DefaultStressLevelRepository())
    @StateObject var happinessLevelViewModel: HappinessLevelViewModel = HappinessLevelViewModel(repository: DefaultHappinessLevelRepository())

    var body: some Scene {
        WindowGroup {
            HomeScreen()
                .environmentObject(stressLevelViewModel)
                .environmentObject(happinessLevelViewModel)
        }
    }
}

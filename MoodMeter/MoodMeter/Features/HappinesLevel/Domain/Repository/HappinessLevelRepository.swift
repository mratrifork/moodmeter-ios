//
//  HappinessLevelRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 11/05/2023.
//

import Foundation
import Combine

protocol HappinessLevelRepository: ObservableObject {
    func submit(happinessLevel: Int) -> AnyPublisher<EmptyResponse, Error>
}

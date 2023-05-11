//
//  StressLevelRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 11/05/2023.
//

import Foundation
import Combine

protocol StressLevelRepository{
    func CommitStressLevel(stressLevel: Int) -> AnyPublisher<EmptyResponse, Error>
}

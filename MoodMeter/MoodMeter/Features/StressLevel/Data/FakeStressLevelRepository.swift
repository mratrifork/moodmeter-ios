//
//  FakeStressLevelRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 11/05/2023.
//

import Foundation
import Combine

class FakeStressLevelRepository : StressLevelRepository {
    func CommitStressLevel(stressLevel: Int) -> AnyPublisher<EmptyResponse, Error>{
        guard (1...5).contains(stressLevel) else {
            return Fail(error: ValidationError.Default(errorMessage: "Invalid stress level. Level should be from 1 to 5")).eraseToAnyPublisher()
        }
        
        return Just(EmptyResponse())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

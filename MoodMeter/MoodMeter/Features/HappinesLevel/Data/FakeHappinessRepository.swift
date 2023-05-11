//
//  FakeHappinessRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 11/05/2023.
//

import Foundation
import Combine

class FakeHapinessLevelRepository : HappinessLevelRepository {
    func CommitHapinessLevel(happinessLevel: Int) -> AnyPublisher<EmptyResponse, Error>{
        guard (1...5).contains(happinessLevel) else {
            return Fail(error: ValidationError.Default(errorMessage: "Invalid happiness level. Level should be from 1 to 5")).eraseToAnyPublisher()
        }
        
        return Just(EmptyResponse())
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}

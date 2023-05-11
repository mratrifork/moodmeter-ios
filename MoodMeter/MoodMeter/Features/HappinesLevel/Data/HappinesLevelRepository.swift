//
//  HappinesLevelRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 10/05/2023.
//

import Foundation
import Combine

class HappinessLevelRepository {
    let moodApi = MoodApi()
    
    func CommitHapinessLevel(happinessLevel: Int) -> any Publisher<EmptyResponse, Error>{
        guard (1...5).contains(happinessLevel) else {
            return Fail(error: ValidationError.Default(errorMessage: "Invalid happiness level. Level should be from 1 to 5")).eraseToAnyPublisher()
        }
        
        return moodApi.PostHapinessLevel(happinessLevel: happinessLevel).publisher
    }
}

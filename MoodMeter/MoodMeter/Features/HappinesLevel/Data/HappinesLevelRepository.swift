//
//  HappinesLevelRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 10/05/2023.
//

import Foundation

class HappinessLevelRepository {
    let moodApi = MoodApi()
    
    func CommitHapinessLevel(happinessLevel: Int) -> Result<EmptyResponse, Error>{
        guard (1...5).contains(happinessLevel) else {
            return Result.failure(ValidationError.Default(errorMessage: "Invalid happiness level. Level should be from 1 to 5"))
        }
        
        return moodApi.PostHapinessLevel(happinessLevel: happinessLevel)
    }
}

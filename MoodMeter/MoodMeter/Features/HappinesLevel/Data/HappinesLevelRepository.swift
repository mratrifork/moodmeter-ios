//
//  HappinesLevelRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 10/05/2023.
//

import Foundation

class HappinesLevelRepository {
    let moodApi = MoodApi()
    
    func CommitHapinessLevel(happinesLevel: Int) -> Result<EmptyResponse, Error>{
        guard (1...5).contains(happinesLevel) else {
            return Result.failure(ValidationError.Default(errorMessage: "Invalid happines level. Level should be from 1 to 5"))
        }
        
        return moodApi.PostHapinessLevel(happinesLevel: happinesLevel)
    }
}

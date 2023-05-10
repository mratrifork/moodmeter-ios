//
//  StressLevelRepository.swift
//  MoodMeter
//
//  Created by Martin Rasmussen on 10/05/2023.
//  Modified by Jan van Zetten on 10/05/2023.
//

import Foundation

class StressLevelRepository {
    let moodApi = MoodApi()
    
    func CommitStressLevel(stressLevel: Int) -> Result<EmptyResponse, Error>{
        guard (1...5).contains(stressLevel) else {
            return Result.failure(ValidationError.Default(errorMessage: "Invalid stress level. Level should be from 1 to 5"))
        }
        
        return moodApi.PostStressLevel(stressLevel: stressLevel)
    }
}

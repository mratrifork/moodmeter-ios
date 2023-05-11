//
//  HappinesLevelRepository.swift
//  MoodMeter
//
//  Created by Jan van Zetten on 10/05/2023.
//

import Foundation
import Combine

class DefaultHappinessLevelRepository : HappinessLevelRepository{
    let moodApi = MoodApi()
    
    func submit(happinessLevel: Int) -> AnyPublisher<EmptyResponse, Error>{
        guard (1...5).contains(happinessLevel) else {
            return Fail(error: ValidationError.invalidRange(message: "Invalid happiness level. Level should be from 1 to 5")).eraseToAnyPublisher()
        }
        
        return moodApi.post(happinessLevel: happinessLevel)
    }
}

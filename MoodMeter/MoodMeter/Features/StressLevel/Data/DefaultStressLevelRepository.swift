//
//  StressLevelRepository.swift
//  MoodMeter
//
//  Created by Martin Rasmussen on 10/05/2023.
//  Modified by Jan van Zetten on 10/05/2023.
//

import Foundation
import Combine

class DefaultStressLevelRepository : StressLevelRepository, ObservableObject {
    let moodApi = MoodApi()
    
    func commitStressLevel(stressLevel: Int) -> AnyPublisher<EmptyResponse, Error>{
        guard (1...5).contains(stressLevel) else {
            return Fail(error: ValidationError.invalidRange(message: "Invalid stress level. Level should be from 1 to 5")).eraseToAnyPublisher()
        }
        
        return moodApi.postStressLevel(stressLevel: stressLevel)
    }
}

//
//  MoodApi.swift
//  MoodMeter
//
//  Created by Martin Rasmussen on 10/05/2023.
//  Modified by Jan van Zetten on 10/05/2023.
//

import Foundation

class MoodApi {
    func PostStressLevel(stressLevel: Int) -> Result<EmptyResponse, Error> {
        // TODO Send to Frederiks Api
        return Result.success(EmptyResponse())
    }
    
    func PostHapinessLevel(happinessLevel: Int) -> Result<EmptyResponse, Error> {
        // TODO Send to Frederiks Api
        return Result.success(EmptyResponse())
    }
}

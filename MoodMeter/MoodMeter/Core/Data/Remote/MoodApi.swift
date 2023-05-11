//
//  MoodApi.swift
//  MoodMeter
//
//  Created by Martin Rasmussen on 10/05/2023.
//  Modified by Jan van Zetten on 10/05/2023.
//

import Foundation
import Combine

class MoodApi {
    let url = URL(string:"https://app-mood-meter.azurewebsites.net/api/vote")!
    
    func PostStressLevel(stressLevel: Int) -> AnyPublisher<EmptyResponse, Error> {
        let body = "\(stressLevel)"
        let finalBody = body.data(using: .utf8)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { _ -> EmptyResponse in
                return EmptyResponse()
            }.eraseToAnyPublisher()
    }
    
    func PostHapinessLevel(happinessLevel: Int) -> Result<EmptyResponse, Error> {
        // TODO Send to Frederiks Api
        return Result.success(EmptyResponse())
    }
}

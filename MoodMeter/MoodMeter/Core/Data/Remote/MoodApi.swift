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
    let baseUrl = "https://app-mood-meter.azurewebsites.net/api/vote"
    
    func postStressLevel(stressLevel: Int) -> AnyPublisher<EmptyResponse, Error> {
        let url = URL(string:"\(baseUrl)/stress")!
        let body = "{\"value\": \(stressLevel)}"
        let finalBody = body.data(using: .utf8)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { _ -> EmptyResponse in
                return EmptyResponse()
            }.eraseToAnyPublisher()
    }
    
    func postHapinessLevel(happinessLevel: Int) -> AnyPublisher<EmptyResponse, Error> {
        let url = URL(string:"\(baseUrl)/happiness")!
        let body = "{\"value\": \(happinessLevel)}"
        let finalBody = body.data(using: .utf8)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { _ -> EmptyResponse in
                return EmptyResponse()
            }.eraseToAnyPublisher()
    }
}

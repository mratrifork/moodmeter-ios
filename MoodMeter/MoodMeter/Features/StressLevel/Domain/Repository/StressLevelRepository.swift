import Foundation
import Combine

protocol StressLevelRepository: ObservableObject {
    func submit(stressLevel: Int) -> AnyPublisher<EmptyResponse, Error>
}

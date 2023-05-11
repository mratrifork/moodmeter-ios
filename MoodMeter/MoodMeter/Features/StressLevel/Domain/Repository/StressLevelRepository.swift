import Foundation
import Combine

protocol StressLevelRepository: ObservableObject {
    func commitStressLevel(stressLevel: Int) -> AnyPublisher<EmptyResponse, Error>
}

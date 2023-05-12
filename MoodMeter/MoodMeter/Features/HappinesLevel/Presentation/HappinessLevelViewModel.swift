import Foundation
import Combine

class HappinessLevelViewModel: ObservableObject {
    private let repository: any HappinessLevelRepository
    private var disposables = Set<AnyCancellable>()

    @Published var uiState: HappinessLevelUiScreenState = HappinessLevelUiScreenState.empty

    init(repository: any HappinessLevelRepository) {
        self.repository = repository
    }

    private func set(happinessLevel: Int) {
        uiState = uiState.copy(loading: true)
        repository
            .submit(happinessLevel: happinessLevel)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.uiState = self.uiState.copy(loading: false)
            } receiveValue: {_ in }
            .store(in: &disposables)
    }

    func handleEvent(event: HappinessLevelUiEvent) {
        switch (event) {
        case .submit(let level): set(happinessLevel: level)
        }
    }
}

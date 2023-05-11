import Foundation
import Combine

class StressLevelViewModel: ObservableObject {
    private let repository: any StressLevelRepository
    private var disposables = Set<AnyCancellable>()

    @Published var uiState: StressLevelUiScreenState = StressLevelUiScreenState.empty

    init(repository: any StressLevelRepository) {
        self.repository = repository
    }

    private func set(stressLevel: Int) {
        uiState = uiState.copy(loading: true)
        repository
            .submit(stressLevel: stressLevel)
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.uiState = self.uiState.copy(loading: false)
            } receiveValue: {_ in }
            .store(in: &disposables)
    }

    func handleEvent(event: StressLevelUiEvent) {
        switch (event) {
        case .submit(let level): set(stressLevel: level)
        }
    }
}

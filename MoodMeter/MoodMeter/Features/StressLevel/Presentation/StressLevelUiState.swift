import Foundation

struct StressLevelUiScreenState {
    let loading: Bool
    let voted: Bool
}

extension StressLevelUiScreenState {
    static var empty: StressLevelUiScreenState {
        return StressLevelUiScreenState(
            loading: false,
            voted: false
        )
    }

    func copy(loading: Bool? = nil, voted: Bool? = nil) -> StressLevelUiScreenState {
        return StressLevelUiScreenState(
            loading: loading ?? self.loading,
            voted: voted ?? self.loading
        )
    }
}

enum StressLevelUiEvent {
    case submit(level: Int)
}

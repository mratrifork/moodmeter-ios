import Foundation

struct HappinessLevelUiScreenState {
    let loading: Bool
    let voted: Bool
}

extension HappinessLevelUiScreenState {
    static var empty: HappinessLevelUiScreenState {
        return HappinessLevelUiScreenState(
            loading: false,
            voted: false
        )
    }

    func copy(loading: Bool? = nil, voted: Bool? = nil) -> HappinessLevelUiScreenState {
        return HappinessLevelUiScreenState(
            loading: loading ?? self.loading,
            voted: voted ?? self.loading
        )
    }
}

enum HappinessLevelUiEvent {
    case submit(level: Int)
}

import Foundation
import SwiftUI

struct Digit: View {
    let digit: Int
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Text("\(digit)")
        }.buttonStyle(DigitButtonStyle())
    }
}

import Foundation
import SwiftUI

struct QuestionHeader: View {
    let text: String

    var body: some View {
        Text(text)
            .foregroundColor(Color.white)
            .font(Font.title)
            .fontWeight(Font.Weight.bold)
    }
}

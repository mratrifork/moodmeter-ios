import SwiftUI

struct RoundedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.lightPurple)
            .foregroundColor(.white)
            .font(.system(size: 14))
            .clipShape(Capsule())

    }
}

struct RoundedButton_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            Button("Click me") {

            }.buttonStyle(RoundedButton())
        }
    }
}

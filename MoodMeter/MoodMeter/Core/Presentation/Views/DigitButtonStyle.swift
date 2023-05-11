import SwiftUI

struct DigitButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(25)
            .background(Color.lightPurple)
            .foregroundColor(.white)
            .fontWeight(.black)
            .font(.system(size: 18))
            .clipShape(Circle())
            .scaleEffect(configuration.isPressed ? 1.4 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)

    }
}

struct DigitButtonStyle_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            Button("1") {

            }.buttonStyle(DigitButtonStyle())
        }
    }
}

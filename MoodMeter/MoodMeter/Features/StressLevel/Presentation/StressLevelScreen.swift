import SwiftUI

struct StressLevelScreen: View {
    @EnvironmentObject private var repository: DefaultStressLevelRepository

    var body: some View {
        StressLevelContent(viewModel: StressLevelViewModel(repository: repository))
    }
}

struct StressLevelContent: View {
    @ObservedObject private var viewModel: StressLevelViewModel

    init(viewModel: StressLevelViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.darkerPurple.edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    HStack(spacing: 10) {
                        ForEach(1...5, id: \.self) { level in
                            Digit(digit: level) {
                                viewModel.handleEvent(event: .submit(level: level))
                            }
                        }
                    }.padding()
                }
            }
        }.appBar(isBackAvailable: true)
    }
}

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


struct StressLevelScreen_Previews: PreviewProvider {
    static var previews: some View {
        StressLevelScreen().environmentObject(FakeStressLevelRepository())
    }
}

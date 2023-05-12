import SwiftUI

struct HappinessLevelScreen: View {
    @EnvironmentObject private var viewModel: HappinessLevelViewModel

    var body: some View {
        HappinessLevelContent(viewModel: viewModel)
    }
}

struct HappinessLevelContent: View {
    @ObservedObject private var viewModel: HappinessLevelViewModel

    init(viewModel: HappinessLevelViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                QuestionHeader(text: "How happy are you?")
                    .padding(Edge.Set.top, CGFloat(integerLiteral: 10))
                Text("1 is very sad, 5 is happy.")
                    .foregroundColor(Color.white)
                Spacer()
                Spacer()
                HStack(spacing: 10) {
                    ForEach(1...5, id: \.self) { level in
                        Digit(digit: level) {
                            viewModel.handleEvent(event: .submit(level: level))
                        }
                    }
                }.padding()
            }
        }.appBar(isBackAvailable: true)
    }
}


struct HappinessLevelScreen_Previews: PreviewProvider {
    static var previews: some View {
        HappinessLevelScreen().environmentObject(HappinessLevelViewModel(repository: FakeHappinessLevelRepository()))
    }
}

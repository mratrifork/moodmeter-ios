import SwiftUI

struct StressLevelScreen: View {
    @EnvironmentObject private var viewModel: StressLevelViewModel

    var body: some View {
        StressLevelContent(viewModel: viewModel)
    }
}

struct StressLevelContent: View {
    @ObservedObject private var viewModel: StressLevelViewModel

    init(viewModel: StressLevelViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        ZStack {
            Color.darkerPurple.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                QuestionHeader(text: "How stressed are you?")
                    .padding(Edge.Set.top, CGFloat(integerLiteral: 10))
                Text("1 is very stressed, 5 is not stressed.")
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

                if(viewModel.uiState.voted){
                    NavigationLink("Next"){
                        HappinessLevelScreen()
                    }
                }
            }
        }.appBar(isBackAvailable: true)
    }
}

struct StressLevelScreen_Previews: PreviewProvider {
    static var previews: some View {
        StressLevelScreen().environmentObject(StressLevelViewModel(repository:FakeStressLevelRepository()))
    }
}

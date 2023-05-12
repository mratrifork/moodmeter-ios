import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Spacer()
                    NavigationLink {
                        StressLevelScreen()
                    } label: {
                        Text("How are you?").frame(maxWidth: .infinity)
                    }
                    .buttonStyle(RoundedButton())
                }.padding()
            }.background(Image("bg").resizable().edgesIgnoringSafeArea(.all))
        }
    }
}

struct HomeScreen_Preview: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .environmentObject(StressLevelViewModel(repository: FakeStressLevelRepository()))
            .environmentObject(HappinessLevelViewModel(repository: FakeHappinessLevelRepository()))
    }
}

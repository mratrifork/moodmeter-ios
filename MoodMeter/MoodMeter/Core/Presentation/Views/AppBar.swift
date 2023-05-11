import SwiftUI

struct AppBar: ViewModifier {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    let title: String
    let isBackAvailable: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .if(isBackAvailable) {view in
            view.navigationBarItems(leading: Button(action: {
                self.mode.wrappedValue.dismiss()
            }) {
                Image("ic-back")
            })
        }
    }
}

extension View {
    func appBar(title: String = "", isBackAvailable: Bool = false) -> some View {
        self.modifier(AppBar(title: title, isBackAvailable: isBackAvailable))
    }
}

extension View {
   @ViewBuilder
   func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}

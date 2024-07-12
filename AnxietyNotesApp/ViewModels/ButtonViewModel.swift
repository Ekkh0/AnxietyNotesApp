import SwiftUI
import Combine

class ButtonViewModel: ObservableObject {
    @Published var isDisabled: Bool = true

    func toggleDisable() {
        isDisabled.toggle()
    }
}

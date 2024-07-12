import SwiftUI

struct AddNoteButtonView: View {
    @ObservedObject var viewModel: ButtonViewModel

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Circle()
                    .fill(viewModel.isDisabled ? Color.gray : Color.indigo)
                    .shadow(color: viewModel.isDisabled ? .clear : .blackShadowDarker, radius: 10.71, y: 3.57)
                    .frame(width: 80, height: 80, alignment: .bottomTrailing)
                    .overlay {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        if !viewModel.isDisabled {
                            viewModel.toggleDisable()
                        }
                    }
                    .disabled(viewModel.isDisabled)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    AddNoteButtonView(viewModel: ButtonViewModel())
}

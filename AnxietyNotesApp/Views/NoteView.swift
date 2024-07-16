
import SwiftUI

struct NoteView: View {
    @State private var viewModel: ViewModel
    @EnvironmentObject var router: Router
    
    init(note: Note? = nil){
        _viewModel = State(initialValue: ViewModel(datasource: .shared, note: note))
    }
    
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Button {
                        router.navigateToRoot()
                    } label: {
                        HStack(spacing: 3)
                        {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                    Spacer()
                    Text(viewModel.currentDateString())
                        .font(.system(size: 18))
                        .foregroundColor(Color(UIColor.label))
                        .fontWeight(.semibold)
                    Spacer()
                    //SAVE
                    Button("Done") {
                        viewModel.saveNote()
                        HomeView.ViewModel.shared.fetchNotes()
                        viewModel.navigateToSaveNote = true
                    }
                    .foregroundColor(viewModel.text.isEmpty ? Color.gray : Color.indigo)
                    .disabled(viewModel.text.isEmpty)
                }
                .foregroundColor(.indigo)
                HStack{
                    //INPUT TITLE
                    TextField("Title...", text: $viewModel.title)
                        .bold()
                        .font(.system(size: 48))
                    
                }
                //INPUT DESC
                TextEditor(text: $viewModel.text)
                    .onChange(of: viewModel.text) { oldValue, newValue in
                        if viewModel.text.last == "."{
                            if let sentence = viewModel.text.lastSentence(){
                                viewModel.feeling = viewModel.emoModel?.predictedLabel(for: sentence) ?? "neutral"
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .overlay{
                        if viewModel.text.isEmpty{
                            VStack{
                                HStack{
                                    Text("Share your feeling with us…")
                                        .opacity(0.35)
                                        .allowsHitTesting(false)
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding(.top, 8)
                            .padding(.leading, 6)
                        }
                    }
                
            }
            .padding()
            .cornerRadius(40)
            .padding(8)
            //GRADIENT ANIMATED BG
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            GradientBackground(feeling: $viewModel.feeling)
        )
        .ignoresSafeArea(.keyboard)
        
        NavigationLink(
            destination: SaveNoteView(),
            isActive: $viewModel.navigateToSaveNote,
            label: {
                EmptyView()
            })
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NoteView()
        .environment(\.locale, .init(identifier: "id"))
//            .colorScheme(.dark)
}

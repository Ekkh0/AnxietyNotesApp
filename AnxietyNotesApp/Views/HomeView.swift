import SwiftUI
import WidgetKit

struct HomeView: View {
    @State private var viewModel = HomeView.ViewModel.shared
    var colors = ["Latest", "Oldest"]
    @State private var selectedColor = "Latest"
    @EnvironmentObject var router: Router
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.indigo]
    }
    
    var body: some View {
            ZStack{
                
                VStack {
                    if viewModel.notes.isEmpty{
                        VStack{
                            Image(.notebookBro1)
                                .resizable()
                                .frame(width: 198, height: 198)
                            VStack {
                                Text("Express your feeling")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 4)
                                Text("Start writing to help you calm and relieve your anxiety")
                                    .multilineTextAlignment(.center)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        .padding(.bottom, 16)
                    }
                    
                    
                }
                .padding()
                .navigationTitle("How was your day?")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        Button {
                            viewModel.showingPopover = true
                        } label: {
                            HStack(spacing: 3)
                            {
                                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                    .foregroundColor(.indigo)
                            }
                        }
                        .popover(isPresented: $viewModel.showingPopover) {
                            Form{
                                Picker("", selection: $selectedColor) {
                                    ForEach(colors, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(.inline)
                            }
                            .presentationCompactAdaptation(.popover)
                            .frame(minWidth: 200, minHeight: 150)
                        }
                    }
                    ToolbarItem(placement: .bottomBar)
                    {
                        NavigationLink(destination: NoteView() .navigationBarBackButtonHidden(true)) {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.indigo)
                        }
                    }
                }
                .toolbarBackground(.visible, for: .bottomBar)
                
//                ScrollView {
                    List{
                        ForEach(selectedColor == "Latest" ? viewModel.notes : viewModel.notes.reversed(), id: \.self) { note in
                            SmallCardView(note: note)
                                .listRowSeparator(.hidden)
                                .listSectionSeparator(.hidden)
                                .listRowBackground(Color.clear)
                                .overlay{
                                    NavigationLink(destination: NoteView(note: note)) {
                                        EmptyView()
                                    }
                                    .navigationBarBackButtonHidden(true)
                                    .opacity(0)
                                }
                                .swipeActions{
                                    Button(role: .destructive) {
                                        viewModel.deleteNote(note: note)
                                        viewModel.fetchNotes()
                                        WidgetCenter.shared.reloadTimelines(ofKind: "NewNoteWidget")
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                        }
                    }
                    .listStyle(.plain)
                    
//                }
            }
            .background(Color.bg)
            .onChange(of: viewModel.notes) {
                for note in viewModel.notes{
                    print(note.id.uuidString)
                }
            }
        }

    }
    
    


#Preview {
    HomeView()
//        .colorScheme(.dark)
}

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ButtonViewModel()
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.indigo]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView{
                    VStack(alignment: .leading) {
                        CardView()
                            .onTapGesture {
                                viewModel.toggleDisable()
                            }
                        Spacer()
                    }
                    .padding()
                    
                }
                
                
                AddNoteButtonView(viewModel: viewModel)
            }
            .background(Color.bg)
            .navigationTitle("Lorem Ipsum")
            .navigationBarTitleDisplayMode(.large)
                
        }
    }
    
    
}

#Preview {
    HomeView()
}

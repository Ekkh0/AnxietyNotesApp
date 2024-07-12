//
//import SwiftUI
//
//struct SmallCardView: View {
//    @State private var animateGradient = false
//    
//    var body: some View {
//        VStack(alignment: .leading){
//            HStack{
//                Text("Lorem Ipsum")
//                Spacer()
//                Text("Jul, 10")
//            }
//            .padding(16)
//            HStack{
//                Button {
//                    
//                }
//            label: {
//                Image(systemName: "arrow.right").foregroundColor(.white)
//            }
//            .frame(width: 80, height: 21.54)
//            .background(
//                LinearGradient(colors: [.gray, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .edgesIgnoringSafeArea(.all)
//                    .hueRotation(.degrees(animateGradient ? 45 : 0))
//            )
//            }
//            .clipShape(RoundedRectangle(cornerRadius: 20))
//            .padding(16)
//        }
//        .frame(width: 361)
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .padding()
//    
//    }
//}
//
//let mainGray = Color(hex: 0x212121)
//let mainGreen = Color(hex: 0x019CC8)
//let mainBlue = Color(hex: 0x0188E5)
//let bgPurple = Color(hex: 0xF2F2F7)
//
//extension Color {
//    init(hex: Int, opacity: Double = 1) {
//        self.init(
//            .sRGB,
//            red: Double((hex >> 16) & 0xff) / 255,
//            green: Double((hex >> 08) & 0xff) / 255,
//            blue: Double((hex >> 00) & 0xff) / 255,
//            opacity: opacity
//        )
//    }
//}
//
//#Preview {
//    SmallCardView()
//}

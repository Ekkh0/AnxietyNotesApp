
import SwiftUI

struct SmallCardView: View {
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(note.title ?? "")
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                Spacer()
                
                Circle()
                    .fill(.red) // warna emotionnya, tapi blm dynamic
                    .frame(width: 17)
            }
            .padding(.horizontal, 33)
        }
        .frame(width: 361, height: 65)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 3)
        .padding(5)
    
    }
}

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

//#Preview {
//    SmallCardView(note: Note(title: "Sample Title", content: "Sample Content", date: Date(), sumEmotion: "Happy"))
//}



import SwiftUI

struct SmallCardView: View {
    let note: Note?
    
    var body: some View {
        let colors: [Color] = {
            if let note = note {
                return Feelings(label: note.sumEmotion)?.feelingColor ?? [.clear, .clear]
            } else {
                return [.black, .white]
            }
        }()
        VStack(alignment: .leading){
            HStack (spacing: 10 ){
                if let note = note{
                    Text(note.content ?? "")
                        .opacity(0.75)
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                        .lineLimit(1)
                        
                }
                Spacer()
                
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(stops: [
                                Gradient.Stop(color: colors[1], location: 0.00),
                                Gradient.Stop(color: colors[0], location: 1.00)
                            ]),
                            startPoint: UnitPoint(x: 0.86, y: 1),
                            endPoint: UnitPoint(x: 0.16, y: 0)
                        )
                    )
                    .frame(width: 17)
            }
            .padding(.horizontal, 25)
        }
        .frame(width: 361, height: 65)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.07), radius: 10, x: 0, y: 3)
        //.padding(5)

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


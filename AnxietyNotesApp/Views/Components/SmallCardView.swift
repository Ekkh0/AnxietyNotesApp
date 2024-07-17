
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
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color(UIColor.label).opacity(0.07), radius: 10, x: 0, y: 3)
        //.padding(5)
    }
}

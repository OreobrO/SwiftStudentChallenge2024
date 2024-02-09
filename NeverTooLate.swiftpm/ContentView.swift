import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [.red, .blue, .green]
    @State private var buttonColors: [Color] = [.red, .blue, .green, .yellow, .purple]
    
    var body: some View {
        VStack {
            Image(systemName: "flag.and.flag.filled.crossed")
                .font(.system(size: 200))
                .foregroundStyle(colors[0], colors[1], colors[2])
            HStack(spacing: 16){
                ForEach(buttonColors, id: \.self) { buttonColor in
                    Button(action: {
                        self.colors[0] = buttonColor
                        self.colors[1] = buttonColors[((buttonColors.firstIndex(of: buttonColor) ?? 0) + 1) % (buttonColors.count)]
                    }) {
                        Text("\(buttonColor.description)")
                            .foregroundStyle(.white)
                            .frame(width: 100, height: 50)
                            .background{
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundStyle(buttonColor)
                            }
                    }
                }
            }
        }
    }
}

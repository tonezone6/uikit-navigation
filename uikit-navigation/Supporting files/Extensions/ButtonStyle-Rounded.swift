
import SwiftUI

struct RoundedButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .padding(.horizontal, 8)
            .background(Color(white: 0.95))
            .foregroundColor(Color.accentColor)
            .cornerRadius(8)
    }
}

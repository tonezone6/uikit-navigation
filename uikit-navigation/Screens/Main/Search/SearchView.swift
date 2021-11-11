
import SwiftUI

struct SearchView: View {
    var onSearchResults: () -> Void = {}
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "doc.text.magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color(white: 0.95))
            Text("No recent search")
                .foregroundColor(.gray)
            Button("Search results", action: onSearchResults)
                .buttonStyle(RoundedButton())
            Spacer()
        }
        .padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

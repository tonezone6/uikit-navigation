
import SwiftUI

struct AFirstView: View {
    var onSecond: () -> Void = {}
    var onDetails:    () -> Void = {}
    var onSearch:     () -> Void = {}
    var onLogin:      () -> Void = {}
    
    var body: some View {
        VStack {
            Button("Second", action: onSecond)
            Button("Details", action: onDetails)
            Button("Search", action: onSearch)
            Button("Login", action: onLogin)
        }
        .buttonStyle(RoundedButton())
    }
}

struct AFirstView_Previews: PreviewProvider {
    static var previews: some View {
        AFirstView()
    }
}

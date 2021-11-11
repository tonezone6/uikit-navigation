
import SwiftUI

struct CFirstView: View {
    var onSecond: () -> Void = {}
    var onLogin:      () -> Void = {}
    
    var body: some View {
        VStack {
            Button("Second", action: onSecond)
            Button("Login", action: onLogin)
        }
        .buttonStyle(RoundedButton())
    }
}

struct CFirstView_Previews: PreviewProvider {
    static var previews: some View {
        CFirstView()
    }
}

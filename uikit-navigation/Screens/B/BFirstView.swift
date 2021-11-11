
import SwiftUI

struct BFirstView: View {
    var onDetails: () -> Void = {}
    
    var body: some View {
        Button("Details", action: onDetails)
            .buttonStyle(RoundedButton())
    }
}

struct BFirstView_Previews: PreviewProvider {
    static var previews: some View {
        BFirstView()
    }
}

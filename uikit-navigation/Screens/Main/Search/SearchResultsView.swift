
import SwiftUI

struct SearchResultsView: View {
    let items = ["Lorem", "Ipsum", "Dolor"]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in 
                Text(item)
            }
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView()
    }
}

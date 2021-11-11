
import SwiftUI

struct RegisterView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var onRegisterButtonTap: () -> Void = {}
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            TextField("Password", text: $password)
            TextField("Confirm password", text: $confirmPassword)
            
            Button(action: onRegisterButtonTap) {
                Text("Register")
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

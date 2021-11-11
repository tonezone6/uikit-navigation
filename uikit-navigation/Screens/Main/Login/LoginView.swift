
import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var onLoginButtonTap:    () -> Void = {}
    var onRegisterButtonTap: () -> Void = {}
    
    var body: some View {
        Form {
            TextField("Username", text: $username)
            TextField("Password", text: $password)
            
            Button(action: onLoginButtonTap) {
                Text("Login")
            }
            
            Section(header: Text("Don't have an account yet?")) {
                Button(action: onRegisterButtonTap) {
                    Text("Register")
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Image("pasha")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()

                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)

                VStack(spacing: 16) {
                    TextField("E-mail", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .foregroundColor(.orange)

                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .autocapitalization(.none)
                        .foregroundColor(.orange)

                    SecureField("Confirm password", text: $confirmPassword)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .autocapitalization(.none)
                        .foregroundColor(.orange)

                    Button(action: {
                        signUp()
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }
                }
                Spacer(minLength: 190)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Registration Status"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }

    private func signUp() {
        guard password == confirmPassword else {
            alertMessage = "The passwords do not match"
            showAlert = true
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                alertMessage = "Error: \(error.localizedDescription)"
                showAlert = true
            } else if let result = result {
                let db = Firestore.firestore()
                db.collection("users").document(result.user.uid).setData([
                    "email": email,
                    "uid": result.user.uid
                ]) { error in
                    if let error = error {
                        alertMessage = "Error: \(error.localizedDescription)"
                        showAlert = true
                    } else {
                        alertMessage = "You have successfully registered"
                        showAlert = true
                    }
                }
            }
        }
    }
}

struct SignUpView_Previews1: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

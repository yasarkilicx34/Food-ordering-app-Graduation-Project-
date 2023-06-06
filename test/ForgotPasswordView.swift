

import SwiftUI
import FirebaseAuth

struct ForgotPasswordView: View {
    @State private var email = ""

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

                Text("Forgot my password.")
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

                    Button(action: {
                        // firebase password reset
                        if !self.email.isEmpty {
                            Auth.auth().sendPasswordReset(withEmail: self.email) { error in
                                if let error = error {
                                    // Show some kind of error message
                                    print("Failed to send reset email with error: \(error.localizedDescription)")
                                } else {
                                    // Show success message
                                    print("Reset email sent successfully.")
                                }
                            }
                        } else {
                            print("Email field is empty.")
                        }
                    }) {
                        Text("Send Password Reset Link.")
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
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}


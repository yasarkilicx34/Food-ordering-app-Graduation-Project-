
import SwiftUI
import FirebaseAnalytics
import FirebaseAuth
import GoogleSignIn
import AuthenticationServices




struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false

    var body: some View {
        NavigationView {
            if isLoggedIn {
                DashboardView()
            } else {
                loginView
            }
        }
    }
    
    private var loginView: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Image("pasha")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()

                Text("Log In")
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

                    Button(action: {
                        logIn()
                    }) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                            .padding(.horizontal)
                    }

                    HStack {
                        NavigationLink(destination: SignUpView()) {
                            Text("Sing Up")
                                .foregroundColor(.orange)
                                .padding(.horizontal)
                        }

                        Spacer()

                        NavigationLink(destination: ForgotPasswordView()) {
                            Text("Forget My Password")
                                .foregroundColor(.orange)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.horizontal)
                }
                Spacer(minLength: 60)

                VStack {
                    // Google Login Button
                    Button(action: {
                        signInWithGoogle()
                    }) {
                        HStack {
                            Image("google_icon")
                                .resizable()
                                .frame(width: 24, height: 24)
                            Text("Sign in with Google")
                                .fontWeight(.medium)
                        }
                        .padding(.horizontal, 55)
                        .padding(.vertical)
                        .background(Color.black)
                        .cornerRadius(7)
                        .foregroundColor(.white)
                    }
                    
                    // Apple Login Button
                    SignInWithAppleButton(.signIn, onRequest: { request in
                        request.requestedScopes = [.fullName, .email]
                    }, onCompletion: { result in
                        switch result {
                        case .success(let authResults):
                            print("Apple sign in successful: \(authResults)")
                            isLoggedIn = true
                        case .failure(let error):
                            print("Error signing in with Apple: \(error.localizedDescription)")
                        }
                    })
                    .frame(width: 200, height: 45)
                    .cornerRadius(7)
                    .padding(.top)
                                   }
                .padding(.horizontal)
            }
        }
    }

    private func logIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error logging in: (error.localizedDescription)")
            } else {
            Analytics.logEvent(AnalyticsEventLogin, parameters: [
            AnalyticsParameterMethod: "email_password"
            ])
            print("User logged in successfully")
            isLoggedIn = true
            }
            }
            }
    private func signInWithGoogle() {
        // Google sign in logic
    }
}

struct ContentView_Previews: PreviewProvider {
static var previews: some View {
ContentView()
}
}

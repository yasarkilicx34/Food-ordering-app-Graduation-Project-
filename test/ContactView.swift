

import SwiftUI
import SafariServices
import Firebase
import Foundation

struct ContactView: View {
    @State private var showSafari = false
    @State private var feedbackText = ""
    @State private var name = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var showAlert = false
    
    let url = URL(string: "https://goo.gl/maps/PfCinVyEePBxU3kp8")!
    
    var body: some View {
        ScrollView {
            VStack() {
                Image("restaurant")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .padding(.horizontal)
                Text("About the Restaurant")
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                Spacer()
                VStack() {
                    Text("Pasha Fish & Chips is an award-winning restaurant founded in 2005, offering high-quality and delicious seafood and fried dishes. Our menu includes tasty fish and chips, various kebabs, pizzas, and salads prepared with fresh ingredients.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Spacer()
                    
                    VStack() {
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.orange)
                            Text("+90 123 456 78 90")
                                .font(.callout)
                                .multilineTextAlignment(.center)
                        }
                        
                        VStack() {
                            HStack {
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(.orange)
                                Text("info@pashafishandchips.com")
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                            }
                            
                            HStack {
                                Image(systemName: "map.fill")
                                    .foregroundColor(.orange)
                                Text("1234 Street, No: 56, Istanbul, Turkey")
                                    .font(.callout)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }
                    .padding(.horizontal)
                    Spacer()
                    Text("Work Hours")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Text("Monday - Friday: 11:00 AM - 11:00 PM\nSaturday - Sunday: 12:00 PM - 11:00 PM")
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        self.showSafari = true
                    }) {
                        Text("Show In Map")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .sheet(isPresented: $showSafari) {
                        SafariView(url: url)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Feedback")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        
                        TextField("Name", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Surname", text: $surname)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("E-mail", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.none)
                        
                        TextViewWrapper(text: $feedbackText)
                            .frame(height: 120)
                            .border(Color.gray, width: 1)
                            .cornerRadius(5)
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        saveFeedback()
                    }) {
                        Text("Send Feedback")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Feedback Sent"), message: Text("Thank you for your feedback!"), dismissButton: .default(Text("OK")))
        }
    }
    
    
    
    func saveFeedback() {
        let feedbackData: [String: Any] = [
            "name": name,
            "surname": surname,
            "email": email,
            "text": feedbackText,
            "timestamp": Date()
        ]
        
        let db = Firestore.firestore()
        
        db.collection("feedback").addDocument(data: feedbackData) { error in
            if let error = error {
                print("Error saving feedback: \(error.localizedDescription)")
            } else {
                print("Feedback saved successfully")
                
             
                let feedbackDetails = """
                Geri bildirim alındı:
                Adı: \(name)
                Soyadı: \(surname)
                E-posta: \(email)
                Geri Bildirim: \(feedbackText)
                Zaman: \(Date())
                """

                sendEmail(subject: "Yeni Geri Bildirim Geldi", body: feedbackDetails)
                
                showAlert = true
                feedbackText = ""
                name = ""
                surname = ""
                email = ""
            }
        }
    }

    
    struct SafariView: UIViewControllerRepresentable {
        let url: URL
        
        func makeUIViewController(context: Context) -> SFSafariViewController {
            return SFSafariViewController(url: url)
        }
        
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
            
        }
    }
    
    struct ContactView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                ContactView()
            }
        }
    }
}

struct TextViewWrapper: UIViewRepresentable {
    typealias UIViewType = UITextView
    
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.isScrollEnabled = true
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        return textView
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var parent: TextViewWrapper

        init(_ textView: TextViewWrapper) {
            self.parent = textView
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}

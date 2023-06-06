

import SwiftUI
import UIKit
import Firebase
import FirebaseFirestore
import Foundation


extension Dictionary where Key == String, Value == String {
    func percentEncoded() -> Data? {
        return map { (key, value) in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            return escapedKey! + "=" + escapedValue!
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

func sendEmail(subject: String, body: String) {
    let url = URL(string: "https://api.mailgun.net/v3/sandboxf973c18cf6d14263aefd2f8787f83c85.mailgun.org/messages")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("Basic " + ("api:45d72f8b7b137a872e47f1994e8207ba-5d9bd83c-db705ca8".data(using: .utf8)!.base64EncodedString()), forHTTPHeaderField: "Authorization")

    let parameters: [String: String] = [
        "from": "Mailgun Sandbox <postmaster@sandboxf973c18cf6d14263aefd2f8787f83c85.mailgun.org>",
        "to": "PASHA <barpashafish@gmail.com>",
        "subject": subject,
        "text": body
    ]
    
    request.httpBody = parameters.percentEncoded()

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
        } else if let data = data {
            print("Data:\n\(String(data: data, encoding: .utf8) ?? "")")
        } else {
            print("No data")
        }
    }
    
    task.resume()
}



struct AddressView: View {
    @ObservedObject var cart: CartViewModel
    @Binding var showAddressView: Bool
    @State private var showAlert = false
    @State private var errorMessage = ""
    @State private var name = ""
    @State private var addressLine1 = ""
    @State private var addressLine2 = ""
    @State private var city = ""
    @State private var zipCode = ""
    @State private var selectedPaymentOption: PaymentType? = nil
    @State private var showCashOnDeliveryConfirmation = false
    @State private var showingAlert = false
    
    private var isFormValid: Bool {
        !name.isEmpty && !addressLine1.isEmpty && !city.isEmpty && !zipCode.isEmpty
    }
    
    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                    Text("Address Information")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 20)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Name Surname")
                            .font(.headline)
                        TextField("Name Surname", text: $name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Address Line 1")
                            .font(.headline)
                        TextField("Address Line 1", text: $addressLine1)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Address Line 2")
                            .font(.headline)
                        TextField("Address Line ", text: $addressLine2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("City")
                            .font(.headline)
                        TextField("City", text: $city)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    
                      

                        VStack(alignment: .leading, spacing: 10) {
                            Text("Zip Code")
                                .font(.headline)
                            TextField("Zip Code", text: $zipCode)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }

                        Text(isFormValid ? "" : "Please fill in all the information.")
                            .foregroundColor(.red)

                        Button(action: {
                            if isFormValid {
                                showCashOnDeliveryConfirmation = true
                            } else {
                                errorMessage = "Please fill in all the information."
                                showingAlert = true
                            }
                        }) {
                            Text("Cash on Delivery.")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.orange)
                                .cornerRadius(10)
                        }
                        .padding(.top, 10)
                        .alert(isPresented: $showCashOnDeliveryConfirmation) {
                            Alert(
                                title: Text("Are you sure?"),
                                message: Text("Are you sure you want to choose the cash on delivery option?"),
                                primaryButton: .default(Text("Yes"), action: {
                                    addOrderToFirebase() // Here we add the order to Firebase
                                }),
                                secondaryButton: .cancel(Text("No"))
                            )
                        }
                }
                                .padding(.horizontal)
                            }
                            .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
                            .navigationBarTitle("Adress Information", displayMode: .inline)
                            .navigationBarItems(trailing: Button(action: {
                                withAnimation {
                                    showAddressView = false
                                }
                            }) {
                                Text("Close")
                            })
                        }
                    }
    
    func addOrderToFirebase() {
        let db = Firestore.firestore()
        let cartItems = cart.items.map { ["productName": $0.name, "quantity": $0.quantity] }
        var paymentType: String
        
        switch selectedPaymentOption {
        case .cashOnDelivery:
            paymentType = "Cash On Delivery"
        case .online:
            paymentType = "Online"
        default:
            paymentType = "Unknown"
        }
        
        let orderDetails = """
        Name: \(name)
        Address Line 1: \(addressLine1)
        Address Line 2: \(addressLine2)
        City: \(city)
        Zip Code: \(zipCode)
        Payment Type: \(paymentType)
        Cart Items: \(cartItems)
        """
        
        sendEmail(subject: "Yeni Sipariş Alındı", body: orderDetails)
        
        db.collection("orders").addDocument(data: [
            "name": name,
            "addressLine1": addressLine1,
            "addressLine2": addressLine2,
            "city": city,
            "zipCode": zipCode,
            "paymentType": paymentType,
            "cartItems": cartItems
        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added")
            }
        }
    }
    
 



    
    
    
    
    

}





import SwiftUI

struct DessertView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let dessertItems: [Dessert] = [
        
        Dessert(name: "Tiramisu", image: "tiramisu", price: 4.99, description: "Tiramisu is a classic Italian dessert consisting of layers of espresso-soaked ladyfinger biscuits and a creamy mixture of mascarpone cheese, eggs, and sugar. It is dusted with cocoa powder on top for added flavor. Tiramisu is a delightful dessert enjoyed worldwide, with its balanced combination of sweetness and bitterness. Gramage: Varies depending on serving size."),
       
        Dessert(name: "Cheesecake", image: "cheesecake", price: 5.99, description: "Cheesecake is a creamy and indulgent dessert. It features a buttery graham cracker crust filled with a smooth, velvety cream cheese mixture. The cheesecake is baked until perfectly set and then chilled before serving. With its rich flavor and various topping options like fresh fruits or chocolate, cheesecake is a beloved dessert enjoyed by many for its irresistible creaminess and delightful sweetness."),
       
        Dessert(name: "Brownie", image: "brownie", price: 3.99, description: "Brownie is a delectable dessert loved by chocolate enthusiasts. It is a dense and fudgy square-shaped treat made with rich chocolate, butter, sugar, eggs, and flour. Brownies have a slightly crisp exterior and a gooey, moist interior. They can be enjoyed plain or enhanced with additions like nuts, chocolate chips, or swirls of caramel. Brownies are often served warm and paired with a scoop of vanilla ice cream for an extra indulgence. With their intense chocolate flavor and irresistible texture, brownies are a delightful treat for any chocolate lover.")
    ]
    
    @State private var selectedDessert: Dessert?
    @State private var showDessertDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Desserts")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(dessertItems) { dessert in
                        Button(action: {
                            selectedDessert = dessert
                            showDessertDetails.toggle()
                        }) {
                            DessertItem(dessert: dessert)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedDessert = selectedDessert {
                VStack(alignment: .leading) {
                    Text(selectedDessert.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedDessert.price, specifier: "%.2f") TL")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    
                    Stepper(value: $quantity, in: 1...10) {
                        Text("Quantity: \(quantity)")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    .padding(.vertical)
                    
                    Button(action: {
                        cart.addToCart(item: CartItem(name: selectedDessert.name, image: selectedDessert.image, price: selectedDessert.price, quantity: quantity))
                    }) {
                        Text("Add To Cart")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                }
               
                .padding()
            }
            
            Spacer()
        }
        .sheet(isPresented: $showDessertDetails) {
            if let selectedDessert = selectedDessert {
                DessertDetailView(dessert: selectedDessert)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func DessertItem(dessert: Dessert) -> some View {
        VStack {
            Image(dessert.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(dessert.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct DessertView_Previews: PreviewProvider {
    static var previews: some View {
        DessertView().environmentObject(CartViewModel())
    }
}

struct Dessert: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let price: Double
    let description: String
}

struct DessertDetailView: View {
    let dessert: Dessert
    
    var body: some View {
        VStack {
            Image(dessert.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(dessert.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(dessert.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}

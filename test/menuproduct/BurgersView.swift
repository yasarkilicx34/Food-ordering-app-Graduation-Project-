

import SwiftUI

struct BurgersView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let burgerItems: [Burger] = [
        Burger(name: "Classic Burger", image: "classic_burger", price: 10.99, description: "The Classic Burger is a perfect choice to savor the true essence of flavor. This classic recipe is prepared with a 200-gram (100% beef) patty made from carefully selected fresh ingredients. It includes high-quality beef, fresh lettuce, tomato slices, and onion rings. To enhance the taste, it is flavored with special sauces, and you have the option to add cheese based on your preference. The Classic Burger offers a delightful experience with each bite, making it an ideal choice for a quick and satisfying meal. Place your order now and indulge in the deliciousness of this burger!"),
       
        Burger(name: "Cheese Burger", image: "cheese_burger", price: 12.99, description: "The Cheese Burger offers a classic combination of flavors. It features a 200-gram (100% beef) patty cooked to perfection. Topped with your choice of cheese, such as cheddar, mozzarella, or pepper jack, this burger offers a delightful cheese experience. It is accompanied by fresh lettuce, tomato slices, and onion rings. The burger is served on a freshly toasted sesame seed bun, and it is enhanced with special sauces to elevate the taste."),
       
        Burger(name: "Vegan Burger", image: "vegan_burger", price: 11.99, description: "The Vegan Burger offers a healthy and flavorful plant-based alternative. It is prepared with a plant-based patty made from 100% plant-based ingredients. It is served with fresh lettuce, tomato slices, and onion rings. The burger is seasoned with a variety of vegan-friendly sauces, and it is served on a freshly toasted sesame seed bun."),
       
        Burger(name: "BBQ Burger", image: "bbq_burger", price: 13.99, description: "The BBQ Burger offers a delightful flavor experience. It features a 200-gram (100% beef) patty generously coated with a special BBQ sauce. It is accompanied by fresh lettuce, tomato slices, and onion rings. Additionally, you have the option to add extra toppings like cheddar cheese or crispy bacon to customize your burger. This delicious creation is served on a freshly toasted sesame seed bun."),
        
        Burger(name: "Bacon Burger", image: "bacon_burger", price: 14.99, description: "Bacon Burger, a delicious option enhanced with smoked sliced bacon. This burger is prepared with a 200-gram (100% beef) patty and topped with sliced bacon. It includes fresh lettuce, tomato slices, and onion rings. Additionally, you can add extra ingredients such as cheddar cheese or special sauces to your burger. This satisfying burger is served on a freshly toasted sesame seed bun.")
    ]
    
    @State private var selectedBurger: Burger?
    @State private var showBurgerDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Burgers")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(burgerItems) { burger in
                        Button(action: {
                            selectedBurger = burger
                            showBurgerDetails.toggle()
                        }) {
                            BurgerItem(burger: burger)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedBurger = selectedBurger {
                VStack(alignment: .leading) {
                    Text(selectedBurger.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedBurger.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedBurger.name, image: selectedBurger.image, price: selectedBurger.price, quantity: quantity))
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
        .sheet(isPresented: $showBurgerDetails) {
            if let selectedBurger = selectedBurger {
                BurgerDetailView(burger: selectedBurger)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func BurgerItem(burger: Burger) -> some View {
        VStack {
            Image(burger.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(burger.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct BurgersView_Previews: PreviewProvider {
static var previews: some View {
BurgersView().environmentObject(CartViewModel())
}
}

struct Burger: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct BurgerDetailView: View {
    let burger: Burger
    
    var body: some View {
        VStack {
            Image(burger.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(burger.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(burger.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}




import SwiftUI

struct DrinksView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let drinkItems: [Drink] = [
        
        Drink(name: "Lemonade", image: "limonata", price: 3.99, description: "Limonade, refreshing and citrusy, is a classic thirst-quenching beverage. It is made by combining freshly squeezed lemon juice, water, and sugar (or a sweetener of choice). The result is a tangy and slightly sweet drink that is perfect for hot summer days or any time you desire a burst of citrus flavor. Limonade can be enjoyed over ice, garnished with a lemon slice or mint leaves for a touch of freshness. It's a popular choice to cool down and revitalize with its invigorating taste."),
        
        Drink(name: "Iced Coffee", image: "iced_coffee", price: 4.99, description: "Iced Coffee is a refreshing and energizing beverage enjoyed by coffee lovers. It is made by brewing coffee using various methods like espresso or cold brew, and then chilling it over ice. Sweeteners, milk, or flavorings can be added according to personal preference. The result is a cool and flavorful coffee drink that provides a delightful combination of caffeine and refreshment. Iced Coffee is a popular choice to beat the heat and enjoy a cooling pick-me-up on warm days or anytime you crave a chilled coffee experience."),
        
        Drink(name: "Green Tea", image: "green_tea", price: 2.99, description: "Green Tea is a popular and healthful beverage enjoyed for its unique flavor and potential health benefits. It is made from the leaves of the Camellia sinensis plant, which are minimally processed, allowing the tea to retain its natural green color and delicate taste. Green Tea is known for its refreshing and slightly vegetal flavor profile, often described as grassy or earthy. It is rich in antioxidants and may offer various potential health benefits. Green Tea can be enjoyed hot or iced, making it a versatile and enjoyable beverage for tea enthusiasts seeking a gentle yet invigorating taste."),
        
        Drink(name: "Smoothie", image: "smoothie", price: 5.99, description: "Smoothie is a delicious and refreshing blended beverage made with a combination of fruits, vegetables, yogurt, and other ingredients. It is a versatile drink that allows for endless creativity and customization. Smoothies can be made with a variety of fresh or frozen fruits such as berries, bananas, mangoes, or peaches. They can also incorporate leafy greens like spinach or kale for added nutrition. Additional ingredients like yogurt, milk, or plant-based milk alternatives are often added to create a creamy and smooth texture. Smoothies are a popular choice for a quick and nutritious snack or meal replacement, offering a tasty way to enjoy a variety of fruits and vegetables in one convenient drink.")
    ]
    
    @State private var selectedDrink: Drink?
    @State private var showDrinkDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Drinks")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(drinkItems) { drink in
                        Button(action: {
                            selectedDrink = drink
                            showDrinkDetails.toggle()
                        }) {
                            DrinkItem(drink: drink)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedDrink = selectedDrink {
                VStack(alignment: .leading) {
                    Text(selectedDrink.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedDrink.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedDrink.name, image: selectedDrink.image, price: selectedDrink.price, quantity: quantity))
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
        .sheet(isPresented: $showDrinkDetails) {
            if let selectedDrink = selectedDrink {
                DrinkDetailView(drink: selectedDrink)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func DrinkItem(drink: Drink) -> some View {
        VStack {
            Image(drink.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(drink.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct DrinksView_Previews: PreviewProvider {
static var previews: some View {
DrinksView().environmentObject(CartViewModel())
}
}

struct Drink: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct DrinkDetailView: View {
    let drink: Drink
    var body: some View {
        VStack {
            Image(drink.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(drink.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(drink.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}

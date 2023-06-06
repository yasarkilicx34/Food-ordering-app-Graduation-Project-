

import SwiftUI

struct SandwichesView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let sandwichItems: [Sandwich] = [
        
        Sandwich(name: "Club Sandwich", image: "club_sandwich", price: 7.99, description: "Club Sandwich is a classic sandwich that is loved for its layers of delicious ingredients. It typically consists of three slices of toasted bread with layers of sliced turkey or chicken, crispy bacon, lettuce, tomato, and mayonnaise. Some variations also include sliced cheese, avocado, or boiled eggs. The sandwich is usually cut into quarters and held together with toothpicks. Club Sandwich is known for its combination of savory, salty, and fresh flavors. It is a popular choice for a quick and satisfying meal or a tasty grab-and-go option."),
        
        Sandwich(name: "Turkey Sandwich", image: "turkey_sandwich", price: 8.99, description: "Turkey Sandwich is a classic sandwich made with slices of roasted or smoked turkey meat. It is a popular choice for a quick and delicious meal. The sandwich typically features sliced turkey layered between two slices of bread, along with lettuce, tomato, and mayonnaise. Some variations may include additional toppings like cheese, avocado, bacon, or mustard. The combination of tender turkey, fresh vegetables, and creamy mayo creates a satisfying and flavorful sandwich. Turkey Sandwich is often enjoyed as a versatile option for lunch or a light meal."),
        
        Sandwich(name: "Ham Sandwich", image: "ham_sandwich", price: 8.99, description: "Ham Sandwich is a classic sandwich made with slices of ham, typically served cold or at room temperature. It is a simple yet delicious sandwich option enjoyed by many. The sandwich consists of thinly sliced ham placed between two slices of bread, often accompanied by lettuce, tomato, and mayonnaise. Some variations may include additional ingredients such as cheese, pickles, or mustard. The combination of savory ham, fresh vegetables, and creamy condiments creates a satisfying flavor profile. Ham Sandwich is a versatile choice for a quick and tasty meal or a convenient option for picnics and lunches."),
        
        Sandwich(name: "Cheese Sandwich", image: "cheese_sandwich", price: 7.99, description: "Cheese Sandwich is a classic sandwich that highlights the deliciousness of cheese. It is a simple yet satisfying option enjoyed by cheese lovers of all ages. The sandwich typically consists of one or more types of sliced cheese placed between two slices of bread. Popular cheese choices include cheddar, Swiss, mozzarella, or American cheese. Some variations may also include additional ingredients like tomato, lettuce, or condiments such as mayonnaise or mustard. The combination of the creamy, melty cheese and the soft bread creates a comforting and flavorful sandwich. Cheese Sandwich is a versatile choice for a quick snack or a light meal."),
       
        Sandwich(name: "Veggie Sandwich", image: "veggie_sandwich", price: 7.99, description: "Veggie Sandwich is a flavorful and nutritious sandwich option for those who prefer a plant-based or vegetarian diet. It is packed with a variety of fresh vegetables and delicious ingredients. The sandwich typically features a combination of sliced or grilled vegetables such as lettuce, tomatoes, cucumbers, bell peppers, and onions. It may also include ingredients like avocado, sprouts, cheese, and a spread such as hummus or pesto for added flavor. Veggie Sandwich is a versatile choice that allows for customization based on personal preferences. It offers a satisfying and wholesome meal option for those looking for a lighter, meat-free alternative.")
    ]
    
    @State private var selectedSandwich: Sandwich?
    @State private var showSandwichDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Sandwiches")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(sandwichItems) { sandwich in
                        Button(action: {
                            selectedSandwich = sandwich
                            showSandwichDetails.toggle()
                        }) {
                            SandwichItem(sandwich: sandwich)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedSandwich = selectedSandwich {
                VStack(alignment: .leading) {
                    Text(selectedSandwich.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedSandwich.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedSandwich.name, image: selectedSandwich.image, price: selectedSandwich.price, quantity: quantity))
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
        .sheet(isPresented: $showSandwichDetails) {
            if let selectedSandwich = selectedSandwich {
                SandwichDetailView(sandwich: selectedSandwich)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }
    private func SandwichItem(sandwich: Sandwich) -> some View {
        VStack {
            Image(sandwich.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(sandwich.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct SandwichesView_Previews: PreviewProvider {
static var previews: some View {
SandwichesView().environmentObject(CartViewModel())
}
}

struct Sandwich: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct SandwichDetailView: View {
    let sandwich: Sandwich
    var body: some View {
        VStack {
            Image(sandwich.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(sandwich.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(sandwich.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}

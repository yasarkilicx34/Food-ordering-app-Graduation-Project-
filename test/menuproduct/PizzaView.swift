

import SwiftUI

struct PizzaView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let pizzaItems: [Pizza] = [
       
        Pizza(name: "Margherita", image: "margarita_pizza", price: 10.99, description: "Margherita Pizza is a classic Italian pizza known for its simplicity and delicious flavors. It features a thin crust topped with tomato sauce, fresh mozzarella cheese, and fresh basil leaves. The tomato sauce provides a tangy and savory base, while the mozzarella cheese melts and creates a creamy texture. The pizza is then garnished with aromatic basil leaves, adding a fresh and herbaceous note. Margherita Pizza is loved for its balance of flavors and the use of high-quality ingredients. It is a timeless favorite among pizza lovers and showcases the essence of traditional Italian pizza."),
       
        Pizza(name: "Pepperoni", image: "pepperoni_pizza", price: 12.99, description: "Pepperoni Pizza is a beloved American-style pizza that is known for its bold and savory flavors. It starts with a classic pizza crust topped with tomato sauce and generous amounts of sliced pepperoni. The pepperoni is a type of spicy Italian salami that adds a rich and slightly spicy taste to the pizza. The pizza is then covered with a layer of melted cheese, typically mozzarella, which creates a gooey and stretchy texture. Pepperoni Pizza is often enjoyed for its satisfying combination of tangy tomato sauce, savory pepperoni, and melted cheese. It is a popular choice among pizza enthusiasts and is a staple in many pizzerias."),
       
        Pizza(name: "Vegetarian", image: "vegetarian_pizza", price: 11.99, description: "Vegetarian Pizza is a flavorful and satisfying pizza option that caters to those who follow a vegetarian diet. It features a pizza crust topped with a variety of colorful and nutritious vegetables. Common toppings include bell peppers, onions, mushrooms, tomatoes, olives, and sometimes even fresh spinach or arugula. The pizza is then generously covered with melted cheese, typically mozzarella, which adds a creamy and savory element to the dish. Vegetarian Pizza offers a delicious combination of flavors and textures, showcasing the natural goodness of vegetables. It is a popular choice among vegetarians and a great option for those seeking a meatless pizza."),
        
        Pizza(name: "BBQ Chicken", image: "bbq_chicken_pizza", price: 13.99, description: "BBQ Chicken Pizza is a mouthwatering pizza variety that combines the flavors of barbecue sauce, tender chicken, and melted cheese. It starts with a pizza crust topped with tangy and smoky barbecue sauce, which serves as the base. Diced or shredded cooked chicken is then spread over the sauce, adding a savory and protein-rich element. The pizza is generously covered with melted cheese, often a blend of mozzarella and cheddar, creating a gooey and melty texture. Additional toppings like red onions, cilantro, or even pineapple can be added for extra flavor. BBQ Chicken Pizza offers a delicious balance of sweet, tangy, and savory flavors, making it a popular choice for pizza lovers."),
        
        Pizza(name: "Meat Lovers", image: "meat_lovers_pizza", price: 14.99, description: "Meat Lovers Pizza is a hearty and indulgent pizza variation that is packed with various types of meat toppings. It starts with a pizza crust that is generously topped with a combination of meats such as pepperoni, sausage, ham, and bacon. These meat toppings provide a savory, rich, and satisfying flavor to the pizza. The crust is then covered with a layer of tomato sauce and melted cheese, typically mozzarella, which adds a creamy and gooey texture to the pizza. Meat Lovers Pizza is a favorite among meat enthusiasts who enjoy the bold and robust flavors that the different meats bring to the table. It is a filling and satisfying option for those craving a meaty pizza experience.")
    ]
    
    @State private var selectedPizza: Pizza?
    @State private var showPizzaDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Pizzas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(pizzaItems) { pizza in
                        Button(action: {
                            selectedPizza = pizza
                            showPizzaDetails.toggle()
                        }) {
                            PizzaItem(pizza: pizza)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedPizza = selectedPizza {
                VStack(alignment: .leading) {
                    Text(selectedPizza.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedPizza.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedPizza.name, image: selectedPizza.image, price: selectedPizza.price, quantity: quantity))
                    }) {
                        Text("Add To Cart")
                            .font(.headline)                        .fontWeight(.bold)
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
        .sheet(isPresented: $showPizzaDetails) {
            if let selectedPizza = selectedPizza {
                PizzaDetailView(pizza: selectedPizza)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func PizzaItem(pizza: Pizza) -> some View {
        VStack {
            Image(pizza.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(pizza.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct PizzaView_Previews: PreviewProvider {
static var previews: some View {
PizzaView().environmentObject(CartViewModel())
}
}

struct Pizza: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct PizzaDetailView: View {
    let pizza: Pizza
    var body: some View {
        VStack {
            Image(pizza.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(pizza.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(pizza.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}
                           


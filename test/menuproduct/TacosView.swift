

import SwiftUI

struct TacosView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let tacoItems: [Taco] = [
        
        Taco(name: "Taco al Pastor", image: "taco_al_pastor", price: 5.99, description: "Taco al Pastor is a popular Mexican street food dish that features marinated and spit-roasted pork. It is a flavorful and savory taco option with a distinct blend of spices and cooking techniques. The pork is typically marinated in a combination of spices, such as achiote, garlic, and various chili peppers, which gives it a vibrant red color and rich flavor. The marinated pork is then slowly cooked on a vertical spit, similar to the method used for shawarma or gyros. Once cooked, the tender and juicy pork is thinly sliced and served in warm corn tortillas. Taco al Pastor is often garnished with chopped onions, fresh cilantro, and a squeeze of lime for added freshness. It is a delicious and satisfying choice for taco lovers, offering a delightful combination of flavors and textures."),
        
        Taco(name: "Taco de Asada", image: "taco_de_asada", price: 6.99, description: "Taco de Asada is a classic Mexican street food dish that showcases grilled and thinly sliced beef. It is a flavorful and savory taco option that is loved for its simple yet delicious combination of ingredients. The beef, often skirt or flank steak, is marinated in a mixture of citrus juices, garlic, and various spices to enhance its taste. It is then grilled to perfection, resulting in tender and juicy meat with a smoky flavor. The grilled beef is thinly sliced and served in warm corn tortillas. Taco de Asada is typically garnished with chopped onions, fresh cilantro, and a squeeze of lime to add brightness and freshness. It is a satisfying choice for taco enthusiasts, offering a delightful balance of flavors and textures."),
       
        Taco(name: "Taco de Pescado", image: "taco_de_pescado", price: 7.99, description: "Taco de Pescado is a delightful Mexican street food dish that features crispy battered and fried fish. It is a popular taco option for seafood lovers, offering a tasty combination of flavors and textures. The fish, commonly white fish such as cod or tilapia, is coated in a seasoned batter and deep-fried until golden and crispy. The result is tender and flaky fish with a satisfying crunch. Taco de Pescado is typically served in warm corn tortillas and garnished with shredded cabbage, fresh cilantro, and a tangy sauce such as salsa verde or chipotle mayo. The combination of the crispy fish, crunchy cabbage, and zesty sauce creates a delightful contrast of textures and flavors. It is a refreshing and delicious choice for taco enthusiasts, bringing a taste of the sea to your plate."),
        
        Taco(name: "Taco de Pollo", image: "taco_de_pollo", price: 6.99, description: "Taco de Pollo is a delicious Mexican street food dish that showcases flavorful grilled chicken. It is a popular taco option that combines tender and juicy chicken with a variety of vibrant flavors. The chicken is marinated in a blend of spices, such as cumin, paprika, garlic, and chili powder, to enhance its taste. It is then grilled to perfection, resulting in smoky and succulent chicken. Taco de Pollo is typically served in warm corn tortillas and garnished with diced onions, fresh cilantro, and a squeeze of lime for added freshness. Additional toppings such as salsa, guacamole, or shredded cheese can also be added to enhance the flavors. The combination of the grilled chicken, aromatic spices, and vibrant garnishes creates a mouthwatering taco experience. It is a satisfying and flavorful choice for taco enthusiasts, perfect for enjoying the bold and delicious flavors of Mexican cuisine."),
        
        Taco(name: "Taco de Carnitas", image: "taco_de_carnitas", price: 7.99, description: "Taco de Carnitas is a mouthwatering Mexican street food dish that highlights tender and juicy slow-cooked pork. It is a popular taco option known for its rich flavors and succulent texture. Carnitas, which means little meats in Spanish, involves simmering pork in a flavorful broth until it becomes incredibly tender. The pork is then shredded or chopped and pan-fried to achieve a crispy exterior while retaining its moistness. Taco de Carnitas is traditionally served in warm corn tortillas and garnished with diced onions, fresh cilantro, and a squeeze of lime. Additional toppings such as salsa, guacamole, or pickled jalapeños can be added to enhance the taste. The combination of the savory, melt-in-your-mouth pork, aromatic spices, and zesty garnishes creates a delightful taco experience. It is a satisfying and indulgent choice for taco enthusiasts, allowing them to savor the deliciousness of slow-cooked pork.")
    ]
    
    @State private var selectedTaco: Taco?
    @State private var showTacoDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Tacos")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(tacoItems) { taco in
                        Button(action: {
                            selectedTaco = taco
                            showTacoDetails.toggle()
                        }) {
                            TacoItem(taco: taco)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedTaco = selectedTaco {
                VStack(alignment: .leading) {
                    Text(selectedTaco.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedTaco.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedTaco.name, image: selectedTaco.image, price: selectedTaco.price, quantity: quantity))
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
        .sheet(isPresented: $showTacoDetails) {
            if let selectedTaco = selectedTaco {
                TacoDetailView(taco: selectedTaco)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func TacoItem(taco: Taco) -> some View {
        VStack {
            Image(taco.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(taco.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct TacosView_Previews: PreviewProvider {
    static var previews: some View {
        TacosView().environmentObject(CartViewModel())
    }
}

struct Taco: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let price: Double
    let description: String
}

struct TacoDetailView: View {
    let taco: Taco
    
    var body: some View {
        VStack {
            Image(taco.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(taco.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(taco.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}

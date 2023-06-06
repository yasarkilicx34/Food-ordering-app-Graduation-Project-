
import SwiftUI

struct SushiView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let sushiItems: [Sushi] = [
        
        Sushi(name: "Nigiri", image: "nigiri_sushi", price: 8.99, description: "Nigiri Sushi is a popular type of sushi that consists of a small hand-formed mound of vinegared sushi rice topped with a slice of fresh seafood or other ingredients. It is a classic and elegant sushi presentation that showcases the simplicity and quality of the ingredients. The sushi rice is carefully seasoned with a blend of rice vinegar, sugar, and salt to provide a balanced and flavorful base. The topping can vary and may include fish such as tuna, salmon, or yellowtail, as well as seafood like shrimp or octopus. Nigiri Sushi is often served with a dab of wasabi between the rice and the topping, and it is enjoyed with soy sauce for dipping. It offers a delightful combination of textures and flavors, making it a favorite choice among sushi enthusiasts."),
        
       
        Sushi(name: "Maki", image: "maki_sushi", price: 9.99, description: "Maki Sushi is a type of sushi roll made by wrapping sushi rice and various ingredients in a sheet of seaweed called nori. It is a popular and versatile sushi option that comes in different fillings and flavors. The sushi rice is spread evenly on the nori sheet, and then ingredients such as fish, vegetables, or other seafood are placed on top. The roll is tightly rolled using a bamboo mat and then sliced into bite-sized pieces. Maki Sushi can have different variations, including classic rolls like California Roll or Spicy Tuna Roll, as well as vegetarian options like Avocado Roll or Cucumber Roll. It is often served with soy sauce, wasabi, and pickled ginger for added flavor. Maki Sushi offers a delightful combination of textures and tastes, making it a popular choice for sushi lovers."),

        Sushi(name: "Uramaki", image: "uramaki_sushi", price: 10.99, description: "Uramaki Sushi, also known as inside-out roll, is a type of sushi roll where the rice is on the outside and the seaweed (nori) is on the inside. It is a popular and visually appealing sushi option that offers a variety of fillings and flavors. The sushi rice is spread on a sheet of nori, and then a layer of ingredients such as fish, vegetables, or seafood is added. The roll is then wrapped using a bamboo mat, and sometimes the outer layer of rice is coated with sesame seeds or fish roe for added texture and presentation. Uramaki Sushi can have different fillings and combinations, including favorites like California Roll or Spider Roll. It is often served with soy sauce, wasabi, and pickled ginger. Uramaki Sushi offers a delightful blend of flavors, textures, and visual appeal, making it a popular choice among sushi enthusiasts."),
        
        Sushi(name: "Temaki", image: "temaki_sushi", price: 9.99, description: "Temaki Sushi, also known as hand roll, is a type of sushi that is rolled by hand into a cone shape using a sheet of nori (seaweed). It is a popular and interactive sushi option that allows for customization and enjoyment of fresh flavors. A piece of nori is shaped into a cone, and then sushi rice and various fillings such as fish, vegetables, or seafood are added to the center. The cone is then rolled up by hand, creating a portable and easy-to-eat sushi roll. Temaki Sushi offers a balance of textures and flavors, with the crispness of nori, the softness of rice, and the freshness of the fillings. It is often served with soy sauce, wasabi, and pickled ginger. Temaki Sushi provides a fun and hands-on sushi experience, making it a favorite choice for sushi lovers."),
              
        Sushi(name: "Sashimi", image: "sashimi_sushi", price: 11.99, description: "Sashimi Sushi is a traditional Japanese dish that consists of fresh, raw seafood or fish sliced into thin pieces. It is a pure and simple form of sushi that showcases the natural flavors and textures of the ingredients. Sashimi is typically served without rice or seaweed, allowing the focus to be on the quality and freshness of the seafood. Common types of sashimi include tuna, salmon, yellowtail, and shrimp, but there are many other varieties available. Sashimi is often presented artfully on a platter and garnished with shredded daikon radish, shiso leaves, or other decorative elements. It is commonly enjoyed with soy sauce and wasabi for dipping. Sashimi Sushi offers a delightful experience for seafood enthusiasts, highlighting the delicate flavors and exquisite presentation of raw fish.")
    ]
    
    @State private var selectedSushi: Sushi?
    @State private var showSushiDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Sushi")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(sushiItems) { sushi in
                        Button(action: {
                            selectedSushi = sushi
                            showSushiDetails.toggle()
                        }) {
                            SushiItem(sushi: sushi)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedSushi = selectedSushi {
                VStack(alignment: .leading) {
                    Text(selectedSushi.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedSushi.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedSushi.name, image: selectedSushi.image, price: selectedSushi.price, quantity: quantity))
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
        .sheet(isPresented: $showSushiDetails) {
            if let selectedSushi = selectedSushi {
                SushiDetailView(sushi: selectedSushi)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func SushiItem(sushi: Sushi) -> some View {
        VStack {
            Image(sushi.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(sushi.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct SushisView_Previews: PreviewProvider {
static var previews: some View {
SushiView().environmentObject(CartViewModel())
}
}

struct Sushi: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct SushiDetailView: View {
    let sushi: Sushi
    
    var body: some View {
        VStack {
            Image(sushi.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(sushi.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(sushi.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
    }

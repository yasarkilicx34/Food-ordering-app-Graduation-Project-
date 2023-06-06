

import SwiftUI

struct KebabsView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let kebabItems: [Kebab] = [
       
        Kebab(name: "Döner Kebap", image: "doner_kebap", price: 12.99, description: "Döner Kebap is a popular Turkish street food that has gained worldwide fame. It is made by marinating slices of seasoned meat, usually lamb or chicken, on a vertical rotisserie. As the meat slowly cooks, it is thinly sliced and served in a warm pita bread or wrapped in a flatbread along with various accompaniments. These may include fresh vegetables like lettuce, tomatoes, onions, and cucumbers, as well as traditional sauces such as yogurt-based tzatziki or spicy chili sauce. Döner Kebap is known for its juicy and flavorful meat, combined with the contrasting textures and vibrant flavors of the accompanying ingredients, creating a satisfying and delicious meal."),
       
        Kebab(name: "Adana Kebap", image: "adana_kebap", price: 14.99, description: "Adana Kebap is a traditional Turkish kebab that originates from the city of Adana. It is made with ground lamb or a combination of lamb and beef, mixed with various spices and herbs. The meat mixture is shaped onto skewers and grilled over an open flame, resulting in a flavorful and juicy kebab. Adana Kebap is known for its rich and robust taste, enhanced by the use of spices like red pepper flakes, cumin, and paprika. It is typically served with grilled vegetables, rice, and flatbread. With its bold flavors and satisfying texture, Adana Kebap is a popular choice for meat lovers seeking an authentic and delicious kebab experience."),
      
        Kebab(name: "Urfa Kebap", image: "urfa_kebap", price: 14.99, description: "Urfa Kebap, named after the city of Urfa in Turkey, is a popular and flavorful kebab variety. It is made from ground lamb or a mixture of lamb and beef, seasoned with a unique blend of spices and herbs. The meat mixture is shaped onto skewers and grilled over charcoal or an open flame, resulting in a succulent and aromatic kebab. Urfa Kebap is known for its rich and smoky flavor, imparted by the use of spices like Urfa pepper, which adds a distinct mild heat and a hint of sweetness. It is typically served with traditional accompaniments such as lavash bread, grilled vegetables, and a side of yogurt. Urfa Kebap offers a delightful combination of robust flavors and tender meat, making it a beloved choice among kebab enthusiasts."),
      
        Kebab(name: "Iskender Kebap", image: "iskender_kebap", price: 15.99, description: "Iskender Kebap is a delicious and iconic Turkish dish that originated in the city of Bursa. It is made with tender slices of grilled lamb or beef, traditionally cooked on a vertical rotisserie. The meat is then placed on a bed of freshly baked pita bread, generously topped with a rich tomato-based sauce, and served with a side of creamy yogurt. Additional melted butter and grilled tomatoes are often added to enhance the flavors. İskender Kebap is known for its harmonious combination of tender meat, tangy tomato sauce, and creamy yogurt, creating a mouthwatering experience. It is typically garnished with parsley and enjoyed as a hearty and satisfying meal"),
     
        Kebab(name: "Sish Kebap", image: "sis_kebap", price: 13.99, description: "Shish Kebab, is a popular grilled meat dish that can be found in various Middle Eastern and Mediterranean cuisines. It typically consists of marinated cubes of meat, such as lamb, beef, or chicken, skewered and cooked over an open flame or grill. The meat is seasoned with a blend of spices and herbs, enhancing its flavor and tenderness. Şiş Kebap is loved for its smoky aroma and charred exterior, while the inside remains juicy and succulent. It is often served with rice, grilled vegetables, and accompanied by sauces like tzatziki or tahini. Şiş Kebap offers a delightful combination of grilled flavors and tender meat, making it a beloved choice for meat enthusiasts.")
    ]
    
    @State private var selectedKebab: Kebab?
    @State private var showKebabDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Kebaps")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(kebabItems) { kebab in
                        Button(action: {
                            selectedKebab = kebab
                            showKebabDetails.toggle()
                        }) {
                            KebabItem(kebab: kebab)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedKebab = selectedKebab {
                VStack(alignment: .leading) {
                    Text(selectedKebab.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedKebab.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedKebab.name, image: selectedKebab.image, price: selectedKebab.price, quantity: quantity))
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
        .sheet(isPresented: $showKebabDetails) {
            if let selectedKebab = selectedKebab {
                KebabDetailView(kebab: selectedKebab)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func KebabItem(kebab: Kebab) -> some View {
        VStack {
            Image(kebab.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(kebab.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct KebabsView_Previews: PreviewProvider {
static var previews: some View {
KebabsView().environmentObject(CartViewModel())
}
}

struct Kebab: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct KebabDetailView: View {
    let kebab: Kebab
    
    var body: some View {
        VStack {
            Image(kebab.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(kebab.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(kebab.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}

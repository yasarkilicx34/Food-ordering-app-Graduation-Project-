

import SwiftUI

struct PastaView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let pastaItems: [Pasta] = [
        
        Pasta(name: "Spaghetti Carbonara", image: "spaghetti_carbonara", price: 12.99, description: "Spaghetti Carbonara is a classic Italian pasta dish known for its rich and creamy sauce. It is made with spaghetti noodles tossed in a sauce made from eggs, Parmesan cheese, crispy pancetta or bacon, and black pepper. The heat from the cooked pasta and pancetta or bacon helps to gently cook the eggs, creating a luscious and velvety texture. Spaghetti Carbonara is typically garnished with additional grated Parmesan cheese and chopped parsley for added flavor and freshness. This dish is loved for its simplicity and indulgent taste, making it a favorite among pasta lovers."),
        
        Pasta(name: "Fettuccine Alfredo", image: "fettuccine_alfredo", price: 11.99, description: "Fettuccine Alfredo is a creamy and indulgent pasta dish that hails from Italy. It features long, flat fettuccine noodles tossed in a velvety sauce made with butter, heavy cream, and Parmesan cheese. The sauce is typically prepared by melting butter in a pan, adding cream, and allowing it to simmer until it thickens. Grated Parmesan cheese is then stirred into the sauce, creating a smooth and cheesy coating for the pasta. Fettuccine Alfredo is often garnished with a sprinkle of black pepper and chopped parsley for added flavor and presentation. This dish is beloved for its luxurious and comforting taste, making it a favorite choice for pasta enthusiasts."),
       
        Pasta(name: "Lasagna", image: "lasagna", price: 14.99, description: "Lasagna is a beloved Italian dish that consists of layers of pasta sheets, meat or vegetable filling, and cheese, baked to perfection. The pasta sheets are typically layered with a rich tomato-based meat sauce, creamy béchamel sauce, and a generous amount of cheese, such as mozzarella and Parmesan. Additional ingredients like ground beef, sausage, vegetables, and herbs may be included in the filling to enhance the flavors. The layered components create a harmonious combination of textures and flavors as the lasagna bakes in the oven. This comforting and hearty dish is a favorite among pasta enthusiasts, showcasing the deliciousness of Italian cuisine."),
       
        Pasta(name: "Penne Arrabbiata", image: "penne_arrabbiata", price: 10.99, description: "Penne Arrabbiata is a spicy and flavorful Italian pasta dish. It consists of penne pasta cooked al dente and tossed in a fiery tomato sauce. The sauce is typically made with tomatoes, garlic, red chili peppers, olive oil, and sometimes a splash of white wine. The heat from the chili peppers gives the dish its characteristic spiciness, while the garlic and tomatoes add depth of flavor. Penne Arrabbiata is often garnished with fresh parsley and grated Parmesan cheese. It offers a delightful combination of tangy, spicy, and savory flavors, making it a favorite choice for those who enjoy a bit of heat in their pasta."),
       
        Pasta(name: "Pesto Pasta", image: "pesto_pasta", price: 12.99, description: "Pesto Pasta is a vibrant and flavorful Italian dish that features pasta tossed in a delicious basil sauce known as pesto. The pesto sauce is made from fresh basil leaves, garlic, pine nuts, Parmesan cheese, olive oil, and a hint of lemon juice. These ingredients are blended together to create a vibrant green sauce with a rich and herbaceous flavor. The pasta, typically spaghetti or linguine, is cooked al dente and then coated in the pesto sauce. Pesto Pasta is often garnished with additional Parmesan cheese and fresh basil leaves for added aroma and presentation. This dish offers a delightful burst of freshness and is loved by pesto enthusiasts.")
    ]
    
    @State private var selectedPasta: Pasta?
    @State private var showPastaDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Pastas")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(pastaItems) { pasta in
                        Button(action: {
                            selectedPasta = pasta
                            showPastaDetails.toggle()
                        }) {
                            PastaItem(pasta: pasta)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedPasta = selectedPasta {
                VStack(alignment: .leading) {
                    Text(selectedPasta.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedPasta.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedPasta.name, image: selectedPasta.image, price: selectedPasta.price, quantity: quantity))
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
        
        .sheet(isPresented: $showPastaDetails) {
            if let selectedPasta = selectedPasta {
                PastaDetailView(pasta: selectedPasta)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }
    private func PastaItem(pasta: Pasta) -> some View {
        VStack {
            Image(pasta.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(pasta.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct PastaView_Previews: PreviewProvider {
static var previews: some View {
PastaView().environmentObject(CartViewModel())
}
}

struct Pasta: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct PastaDetailView: View {
    let pasta: Pasta
    var body: some View {
        VStack {
            Image(pasta.image)
                .resizable()
                .scaledToFit()
                .padding()
            Text(pasta.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(pasta.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
    
}

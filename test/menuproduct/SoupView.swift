

import SwiftUI

struct SoupView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let soupItems: [Soup] = [
        
        Soup(name: "Chicken Soup", image: "chicken_soup", price: 8.99, description: "BChicken Soup is a comforting and nourishing soup made with chicken, vegetables, and flavorful broth. It is a classic dish enjoyed for its warmth and soothing qualities. The soup typically features tender pieces of chicken, mixed vegetables such as carrots, celery, and onions, and is cooked in a savory broth seasoned with herbs and spices. It is known for its rich aroma and hearty flavor. Chicken Soup is often considered a go-to option for cold or rainy days, as well as for providing comfort during illness. It is a satisfying and wholesome soup that is both delicious and comforting."),
       
        Soup(name: "Lentil Soup", image: "lentil_soup", price: 7.99, description: "Lentil Soup is a hearty and nutritious soup made with lentils, vegetables, and flavorful seasonings. It is a popular choice among those seeking a delicious and satisfying plant-based meal. The soup features cooked lentils, which are legumes packed with protein and fiber, combined with a medley of vegetables such as carrots, onions, and celery. It is often seasoned with herbs and spices to enhance the flavor. Lentil Soup is known for its rich and comforting texture, and it provides a good source of essential nutrients. It is a nourishing soup option that is both tasty and wholesome."),
       
        Soup(name: "Tomato Soup", image: "tomato_soup", price: 6.99, description: "Tomato Soup is a classic and comforting soup made primarily with tomatoes. It is known for its smooth and velvety texture and rich tomato flavor. The soup is typically made by simmering ripe tomatoes along with onions, garlic, and various herbs and spices. It can be enjoyed as a standalone soup or paired with grilled cheese sandwiches or croutons for added crunch. Tomato Soup is a popular choice for its simplicity and versatility, making it a comforting option for any time of the year. It is a go-to soup for tomato lovers and a favorite for those seeking a warm and satisfying meal."),
        
        Soup(name: "Vegetable Soup", image: "vegetable_soup", price: 8.99, description: "Vegetable Soup is a delicious and nutritious soup made with a variety of fresh vegetables. It is a versatile dish that can include a combination of vegetables such as carrots, celery, onions, peas, corn, and bell peppers. The soup is typically cooked in a flavorful broth and seasoned with herbs and spices to enhance the taste. Vegetable Soup is known for its vibrant colors, comforting aroma, and nourishing qualities. It is a great way to incorporate a variety of vegetables into your diet and is suitable for vegetarians and vegans. Whether enjoyed as a starter or a hearty main course, Vegetable Soup is a wholesome and satisfying option for a balanced meal.")
    ]
    
    @State private var selectedSoup: Soup?
    @State private var showSoupDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Soups")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(soupItems) { soup in
                        Button(action: {
                            selectedSoup = soup
                            showSoupDetails.toggle()
                        }) {
                            SoupItem(soup: soup)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedSoup = selectedSoup {
                VStack(alignment: .leading) {
                    Text(selectedSoup.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedSoup.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedSoup.name, image: selectedSoup.image, price: selectedSoup.price, quantity: quantity))
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
        .sheet(isPresented: $showSoupDetails) {
            if let selectedSoup = selectedSoup {
                SoupDetailView(soup: selectedSoup)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func SoupItem(soup: Soup) -> some View {
        VStack {
            Image(soup.image)
            .resizable()
            .scaledToFit()
            .overlay(
            RoundedRectangle(cornerRadius: 10)
            .stroke(Color.white, lineWidth: 4)
            )
            .mask(
            RoundedRectangle(cornerRadius: 10)
            )
            Text(soup.name)
            .foregroundColor(.orange)
            .fontWeight(.medium)
            .italic()
            }
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            }
            }

            struct SoupsView_Previews: PreviewProvider {
            static var previews: some View {
            SoupView().environmentObject(CartViewModel())
            }
            }

            struct Soup: Identifiable {
            let id = UUID()
            let name: String
            let image: String
            let price: Double
            let description: String
            }

struct SoupDetailView: View {
    let soup: Soup
    var body: some View {
        VStack {
            Image(soup.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(soup.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(soup.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}

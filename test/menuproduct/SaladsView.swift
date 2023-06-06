

import SwiftUI

struct SaladsView: View {
    @EnvironmentObject var cart: CartViewModel
    
    let saladItems: [Salad] = [
        
        Salad(name: "Caesar Salad", image: "caesar_salad", price: 6.99, description: "Caesar Salad is a classic salad that originated in Mexico but gained popularity worldwide. It features crisp romaine lettuce leaves tossed in a creamy and tangy dressing made with anchovies, garlic, Parmesan cheese, lemon juice, and olive oil. The salad is typically garnished with croutons for added crunch and flavor. Optional additions can include grilled chicken, shrimp, or bacon to make it a heartier meal. Caesar Salad is loved for its refreshing and zesty flavors, making it a popular choice as a side dish or a light main course."),
       
        Salad(name: "Yunan Salad", image: "greek_salad", price: 7.99, description: "Greek Salad, also known as Horiatiki, is a refreshing and vibrant salad originating from Greece. It showcases the flavors of the Mediterranean with a combination of fresh vegetables, herbs, and feta cheese. The salad typically includes crisp lettuce, juicy tomatoes, cucumbers, red onions, and Kalamata olives. It is then topped with chunks of tangy feta cheese and sprinkled with dried oregano. The salad is dressed simply with extra virgin olive oil and a splash of lemon juice, enhancing the natural flavors of the ingredients. Greek Salad offers a delightful balance of textures and tastes, making it a popular choice for those seeking a light and healthy salad option."),
       
        Salad(name: "Cobb Salad", image: "cobb_salad", price: 8.99, description: "Cobb Salad is a hearty and flavorful salad that originated in the United States. It is named after its creator, Robert Cobb, who first made it at the Hollywood Brown Derby restaurant. The salad is known for its colorful presentation and variety of ingredients. It typically includes chopped lettuce, grilled chicken breast, hard-boiled eggs, crispy bacon, ripe tomatoes, creamy avocado, crumbled blue cheese, and sliced red onions. These ingredients are arranged in rows or sections on top of the lettuce, creating an appealing visual appeal. Cobb Salad is often served with a tangy and creamy dressing such as blue cheese or ranch dressing. It offers a satisfying combination of textures and flavors, making it a popular choice for a satisfying meal."),
        
        Salad(name: "Waldorf Salad", image: "waldorf_salad", price: 9.99, description: "Waldorf Salad is a classic salad that originated at the Waldorf Hotel in New York City. It is known for its combination of crisp apples, crunchy celery, sweet grapes, and walnuts, all dressed in a creamy mayonnaise-based dressing. The salad is typically made with fresh lettuce as a base and then topped with the diced apples, sliced celery, halved grapes, and chopped walnuts. The creamy dressing, made with mayonnaise and a hint of lemon juice, binds all the ingredients together and adds a tangy flavor. Waldorf Salad offers a refreshing and satisfying mix of textures and flavors, making it a popular choice for a light and flavorful salad option."),
        
        Salad(name: "Nicoise Salad", image: "nicoise_salad", price: 10.99, description: "Nicoise Salad is a French-inspired salad that originated in the city of Nice. It is a vibrant and flavorful salad that combines a variety of ingredients to create a satisfying and well-rounded meal. The salad typically includes boiled or steamed potatoes, blanched green beans, hard-boiled eggs, ripe tomatoes, black olives, and anchovies. It is often garnished with fresh basil or parsley for added freshness and flavor. Nicoise Salad is traditionally dressed with a vinaigrette made with olive oil, Dijon mustard, and vinegar. The combination of the different ingredients creates a harmonious balance of textures and tastes, making Nicoise Salad a popular choice for a light yet fulfilling salad option.")
    ]
    
    @State private var selectedSalad: Salad?
    @State private var showSaladDetails = false
    @State private var quantity = 1
    
    var body: some View {
        VStack {
            Text("Salads")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(saladItems) { salad in
                        Button(action: {
                            selectedSalad = salad
                            showSaladDetails.toggle()
                        }) {
                            SaladItem(salad: salad)
                        }
                    }
                }
                .padding()
            }
            
            if let selectedSalad = selectedSalad {
                VStack(alignment: .leading) {
                    Text(selectedSalad.name)
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    HStack {
                        Text("Price:")
                            .font(.body)
                            .fontWeight(.semibold)
                        Text("\(selectedSalad.price, specifier: "%.2f") TL")
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
                        cart.addToCart(item: CartItem(name: selectedSalad.name, image: selectedSalad.image, price: selectedSalad.price, quantity: quantity))
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
        .sheet(isPresented: $showSaladDetails) {
            if let selectedSalad = selectedSalad {
                SaladDetailView(salad: selectedSalad)
            }
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarBackButtonHidden(false)
    }

    private func SaladItem(salad: Salad) -> some View {
        VStack {
            Image(salad.image)
                .resizable()
                .scaledToFit()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4)
                )
                .mask(
                    RoundedRectangle(cornerRadius: 10)
                )
            Text(salad.name)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct SaladsView_Previews: PreviewProvider {
static var previews: some View {
SaladsView().environmentObject(CartViewModel())
}
}

struct Salad: Identifiable {
let id = UUID()
let name: String
let image: String
let price: Double
let description: String
}

struct SaladDetailView: View {
    let salad: Salad
    
    var body: some View {
        VStack {
            Image(salad.image)
                .resizable()
                .scaledToFit()
                .padding()
            
            Text(salad.name)
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            
            Text(salad.description)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
        .navigationBarItems(trailing: Button(action: {}, label: {}))
        .navigationBarBackButtonHidden(false)
    }
}

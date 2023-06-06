
import SwiftUI




struct DashboardView: View {
    let campaignImages = ["kampanya1", "kampanya2", "kampanya3", "kampanya4"]
    
   

    
    @State private var selectedCampaignIndex = 0
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    let categories = [
        ("Kebabs", "kebabs"),
        ("Fish and Chips", "fish_and_chips"),
        ("Burgers", "burgers"),
        ("Dessert", "dessert"),
        ("Drink", "drink"),
        ("Pizza", "pizza"),
        ("Pasta", "pasta"),
        ("Salads", "salads"),
        ("Sushi", "sushi"),
        ("Tacos", "tacos"),
        ("Soup", "soup"),
        ("Sandwiches", "sandwiches")
        
    ]
 
    
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            if selectedTab == 0 {
                NavigationView {
                    VStack {
                        TabView(selection: $selectedCampaignIndex) {
                            ForEach(0..<campaignImages.count) { index in
                                Image(campaignImages[index])
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .tag(index)
                            }
                        }
                        .frame(height: 200)
                        .tabViewStyle(PageTabViewStyle())
                        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                        .padding(.bottom)
                        .onReceive(timer) { _ in
                            selectedCampaignIndex = (selectedCampaignIndex + 1) % campaignImages.count
                        }
                        
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(categories, id: \.0) { category in
                                    if category.0 == "Kebabs" {
                                        NavigationLink(destination: KebabsView()) {
                                            categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                    
                                    } else if category.0 == "Burgers" {
                                        NavigationLink(destination: BurgersView()) {
                                            categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                    } else if category.0 == "Dessert" {
                                        NavigationLink(destination: DessertView()) {
                                            categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                    } else if category.0 == "Drink" {
                                        NavigationLink(destination: DrinksView()) {
                                            categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                    } else if category.0 == "Pizza" {
                                        NavigationLink(destination: PizzaView()) {
                                            categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                    } else if category.0 == "Pasta" {
                                        NavigationLink(destination: PastaView()) {
                                            categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                    } else if category.0 == "Salads" {
                                        NavigationLink(destination: SaladsView()) {
                                            categoryButton(categoryName: category.0, imageName:category.1)
                                        }
                                        } else if category.0 == "Sushi" {
                                        NavigationLink(destination: SushiView()) {
                                        categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                        } else if category.0 == "Tacos" {
                                        NavigationLink(destination: TacosView()) {
                                        categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                        } else if category.0 == "Soup" {
                                        NavigationLink(destination: SoupView()) {
                                        categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                        } else if category.0 == "Sandwiches" {
                                        NavigationLink(destination: SandwichesView()) {
                                        categoryButton(categoryName: category.0, imageName: category.1)
                                        }
                                        }
                                        }
                                        }
                                        }
                                        .padding()
                                        }
                                        .padding()
                                        .background(Color.white.edgesIgnoringSafeArea(.all))
                                        .navigationBarItems(trailing: Button(action: {}, label: {
                                        
                                       
                                        }))
                                        .navigationBarTitleDisplayMode(.inline)
                                        .toolbar {
                                        ToolbarItem(placement: .principal) {
                                            Text("PASHA FISH & CHIPS")
                                                .font(.title3)
                                                .fontWeight(.bold)
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.center)
                                        }
                                        }
                                        .navigationBarBackButtonHidden(true)
                                        }
                                        } else if selectedTab == 1 {
                                            SearchView()
                                        } else if selectedTab == 2 {
                                        ContactView()
                                        }  else if selectedTab == 3 {
                                            CartView()
                                        }

            
            
            Spacer()
            
            HStack {
                Button(action: {
                    selectedTab = 0
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                            .font(.headline)
                            .fontWeight(.regular)
                            
                    }
                }
                .foregroundColor(selectedTab == 0 ? .black : .white)
                
                Spacer()
                
                Button(action: {
                    selectedTab = 1
                }) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                }
                .foregroundColor(selectedTab == 1 ? .black : .white)
                
                Spacer()
                
                Button(action: {selectedTab = 2
                }) {
                    VStack {
                        Image(systemName: "phone")
                        Text("Contact")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                }
                .foregroundColor(selectedTab == 2 ? .black : .white)
                
                Spacer()
                
                Button(action: {
                    selectedTab = 3
                }) {
                    VStack {
                        Image(systemName: "cart")
                        Text("Cart")
                            .font(.headline)
                            .fontWeight(.regular)
                    }
                }
                .foregroundColor(selectedTab == 3 ? .black : .white)

            }
            

      
            .padding()
            .background(Color.orange)
            .edgesIgnoringSafeArea(.bottom)
        }
    }

    private func categoryButton(categoryName: String, imageName: String) -> some View {
        VStack {
            Image(imageName).resizable()
                .scaledToFit()
                .cornerRadius(10)
            Text(categoryName)
                .foregroundColor(.orange)
                .fontWeight(.medium)
                .italic()
        }
        .background(Color(.systemGroupedBackground))
        .cornerRadius(10)
    }
}

struct DashboardView_Previews: PreviewProvider {
static var previews: some View {
DashboardView()
}
}


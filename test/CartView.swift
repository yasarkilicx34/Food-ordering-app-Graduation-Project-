

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartViewModel
    @State private var showAddressView = false

    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {
                    Text("Cart Is Empty")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                } else {
                    List {
                        ForEach(cart.items) { item in
                            HStack {
                                Image(item.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                        .fontWeight(.bold)

                                    Text("\(item.price, specifier: "%.2f") TL")
                                        .font(.callout)
                                        .foregroundColor(.gray)
                                }

                                Spacer()

                                Stepper("\(item.quantity)", value: Binding(
                                    get: { item.quantity },
                                    set: { newValue in
                                        cart.updateQuantity(for: item, quantity: newValue)
                                    }
                                ), in: 1...10)
                            }
                            .padding(.vertical, 8)
                        }
                        .onDelete(perform: { indexSet in
                            indexSet.forEach { index in
                                cart.removeFromCart(item: cart.items[index])
                            }
                        })
                    }

                    HStack {
                        Text("Total:")
                            .font(.headline)
                            .fontWeight(.bold)

                        Spacer()

                        Text("\(cart.total, specifier: "%.2f") TL")
                            .font(.headline)
                            .foregroundColor(.orange)
                    }
                    .padding([.leading, .trailing, .bottom])

                    Button(action: {
                                            showAddressView = true
                                        }) {
                                            Text("Complete Your Order")
                                                .font(.headline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding()
                                                .frame(maxWidth: .infinity)
                                                .background(Color.orange)
                                                .cornerRadius(10)
                                        }
                                        .padding()
                                    }
                                }
                                .navigationTitle("Cart")
                                .background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
                                .sheet(isPresented: $showAddressView) {
                                    AddressView(cart: cart, showAddressView: $showAddressView)
                                }

                                }
                            }
                        }



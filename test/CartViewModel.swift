

import Foundation
import SwiftUI
import Combine

struct CartItem: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let image: String
    let price: Double
    var quantity: Int
}

enum PaymentType {
    case online
    case cashOnDelivery
}

class CartViewModel: ObservableObject {
    @Published var items: [CartItem] = []
    @Published var selectedPaymentType: PaymentType?

    func addToCart(item: CartItem) {
        if let index = items.firstIndex(of: item) {
            items[index].quantity += item.quantity
        } else {
            items.append(item)
        }
    }

    func removeFromCart(item: CartItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }

    func updateQuantity(for item: CartItem, quantity: Int) {
        if let index = items.firstIndex(of: item) {
            items[index].quantity = quantity
        }
    }

    var total: Double {
        items.reduce(0) { result, item -> Double in
            result + (Double(item.quantity) * item.price)
        }
    }
}


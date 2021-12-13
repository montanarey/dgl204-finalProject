import UIKit
import Foundation
/* --------------------------------
    DGL 204: Prog Mobile App Dev
    Final Project Fall 2021
    Author: Montana Pistell n0145744
    Last Modified: December 13, 2021
    Kind Words: An app designed to encourage users through positive affirmations.
 -------------------------------- */


// Category enum: categories of affirmations
enum Category {
    case selfLove, gratitude, health, relationships, personality, motivation
}

// Affirmation protocol: information about any type of affirmation
protocol Affirmation {
    var content: String {get}
    var category: Category {get}
    var featured: Bool {get}
    func toggle()
    func display() -> String
}

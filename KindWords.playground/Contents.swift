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
    case selfLove, gratitude, health, relationships, motivation
}

// Message protocol: the backbone of an affirmation. Has content, a display state, a toggle display method, and a category
protocol Message {
    var content: String {get set}
    var display: Bool {get set} // whether the affirmation is currently being displayed
    var category: Category? {get set}
    func toggleDisplay()
    init(content: String, category: Category?, display: Bool)
    init(content: String, category: Category?)
    init(content: String)
}

// Affirmation class: represents a single affirmation, which can be created with or without a category.
class Affirmation: Message {
    var content: String
    var category: Category?
    var display: Bool = false
    
    func toggleDisplay() {
        display = !display
    }
    
    required init(content: String, category: Category?, display: Bool) {
        self.content = content
        if let category = category {
            self.category = category
        }
        self.display = display
    }
    
    required init(content: String, category: Category?) {
        self.content = content
        if let category = category {
            self.category = category
        }
    }
    
    required init(content: String) {
        self.content = content
    }
}

// AffirmationGroup class: holds all affirmations and methods for handling them
class AffirmationGroup {
    var group: [Affirmation]
    
    func addAffirmation(content: String, category: Category) {
        let newAffirmation = Affirmation(content: content, category: category)
        group.append(newAffirmation)
    }
    
    func addAffirmation(content: String) {
        let newAffirmation = Affirmation(content: content)
        group.append(newAffirmation)
    }
    
    init() {
        group = []
    }
    
}


// ----- TEST CODE -----
var affirm1 = Affirmation(content: "I get better every single day", category: Category.selfLove)
var affirm2 = Affirmation(content: "I am important", category: Category.selfLove, display: false)
var affirm3 = Affirmation(content: "I am in control of my life")

import UIKit
import Foundation
/* --------------------------------
    DGL 204: Prog Mobile App Dev
    Final Project Fall 2021
    Author: Montana Pistell n0145744
    Last Modified: December 18, 2021
    Kind Words: An app designed to encourage users through positive affirmations.
 -------------------------------- */


// Category enum: categories of affirmations
enum Category {
    case selfLove, gratitude, health, relationships, motivation
}

// Message protocol: the backbone of an affirmation. Has content, a display state, a toggle display method, and a Category.
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
struct AffirmationGroup {
    var group: [Affirmation] = []
    
    mutating func createAffirmation(content: String, category: Category) {
        let newAffirmation = Affirmation(content: content, category: category)
        group.append(newAffirmation)
    }
    
    mutating func createAffirmation(content: String) {
        let newAffirmation = Affirmation(content: content)
        group.append(newAffirmation)
    }
    
    mutating func addAffirmation(affirmation: Affirmation) {
        group.append(affirmation)
    }
}

// Returns a random affirmation from the Affirmation group
func displayRandom(from affirmGroup: AffirmationGroup) -> String {
    let selected = Int.random(in: 1..<affirmGroup.group.count)
    return affirmGroup.group[selected].content
}

// Returns a random affirmation from a specific Category of Affirmation
func displayCategory(category: Category, overallGroup: AffirmationGroup) -> String {
    var categoryGroup = AffirmationGroup() // new empty group
    for affirm in overallGroup.group {
        if affirm.category == category {
            categoryGroup.addAffirmation(affirmation: affirm)
        }
    }
    guard categoryGroup.group.count > 1 else {
        return "error: No Affirmations in this category"
    }
    let selected = Int.random(in: 1..<categoryGroup.group.count)
    return categoryGroup.group[selected].content
}


// ----- TEST CODE -----

// Creating affirmations
var affirm1 = Affirmation(content: "I get better every single day", category: Category.selfLove)
var affirm2 = Affirmation(content: "I am important", category: Category.selfLove, display: false)
var affirm3 = Affirmation(content: "I am in control of my life")

// Creating an affirmation group and adding affirmations
var testAffirmGroup = AffirmationGroup()

testAffirmGroup.createAffirmation(content: "I have people who love me", category: Category.relationships)
testAffirmGroup.createAffirmation(content: "I am doing my best")
testAffirmGroup.createAffirmation(content: "I can achieve my goals", category: Category.motivation)
testAffirmGroup.addAffirmation(affirmation: affirm1)
testAffirmGroup.addAffirmation(affirmation: affirm2)
testAffirmGroup.addAffirmation(affirmation: affirm3)

// displaying a random affirmation from the AffirmationGroup
print("Random affirmations:")
print(displayRandom(from: testAffirmGroup))
print(displayRandom(from: testAffirmGroup))

// Displaying a random affirmation from a specific Category
print("Affirmation from Self Love category:")
print(displayCategory(category: Category.selfLove, overallGroup: testAffirmGroup))

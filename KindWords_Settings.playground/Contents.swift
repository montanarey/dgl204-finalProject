import UIKit
import Darwin

/* --------------------------------
    DGL 204: Prog Mobile App Dev
    Final Project Fall 2021
    Author: Montana Pistell n0145744
    Last Modified: December 18, 2021
    Kind Words: An app designed to encourage users through positive affirmations.
 -------------------------------- */

// Image struct: information about an image
struct Image {
    var url: String
    var description: String
}

//Backgrounds class to hold images for background options
class Backgrounds {
    var images: [Image] = []
    var selected: Image
    
    init() {
        self.selected = images[0]
    }
    
    func selectBackground(_ background: Image) {
        selected = background
    }
    
    func randomBackground() {
        selected = images[Int.random(in: 1...images.count)]
    }
}

// Light/Dark Mode
var theme = true // default is light mode (true)

// Notifications Preference
var notifications = false // default: disabled

// Widget Preference
var widget = false // default: disabled

// Enable/Disable settings toggle
func toggleSetting( setting: inout Bool) {
    setting = !setting
}


// TEST CODE

// Settings
print(theme) // should print true
toggleSetting(setting: &theme)
print(theme) // should print false

print(notifications) // should print false
toggleSetting(setting: &notifications)
print(notifications) // should print true

print(widget) // should print false
toggleSetting(setting: &widget)
print(widget) // should print true

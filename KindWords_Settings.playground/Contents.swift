import UIKit
import Darwin

/* --------------------------------
    DGL 204: Prog Mobile App Dev
    Final Project Fall 2021
    Author: Montana Pistell n0145744
    Last Modified: December 14, 2021
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

func toggleTheme() { // switches between light and dark mode
    theme = !theme
}

// Notifications Preference
var notifications = false // default: disabled

func toggleNotifications() {
    notifications = !notifications
}

// Widget Preference
var widget = false // default: disabled

func toggleWidget() {
    widget = !widget
}

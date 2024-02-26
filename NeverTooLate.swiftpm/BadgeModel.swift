//
//  BadgeModel.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/12/24.
//

import SwiftUI

class BadgeModel: ObservableObject {
    @Published var symbolList: [String] = [
    "figure.walk",
    "airplane",
    "fan.fill",
    "car",
    "house.fill",
    "globe.americas"
    ]
    
    @Published var selectedBadges: [Badge] = []
    @Published var firstSelectedBadges: [Badge] = []
    @Published var secondSelectedBadges: [Badge] = []
    @Published var thirdSelectedBadges: [Badge] = []

    static let key = "savedBadges"
    @Published var firstBadgeList = [
        Badge(name: "Astronaut", symbol: "figure.walk", color: [0.59, 1.00, 0.91], fontWeight: 1),
        Badge(name: "Firefighter", symbol: "airplane", color: [0.48, 0.19, 0.30], fontWeight: 1),
        Badge(name: "Doctor", symbol: "fan.fill", color: [0.62, 0.46, 0.57], fontWeight: 1),
        Badge(name: "Teacher", symbol: "car", color: [0.24, 0.14, 0.18], fontWeight: 1),
        Badge(name: "Police Officer", symbol: "house.fill", color: [0.54, 0.11, 0.81], fontWeight: 1),
        Badge(name: "Actor/Actress", symbol: "globe.americas", color: [0.73, 0.54, 0.50], fontWeight: 1),
        Badge(name: "Professional Athlete", symbol: "figure.walk", color: [0.87, 0.74, 0.89], fontWeight: 1),
        Badge(name: "Artist", symbol: "airplane", color: [0.18, 0.34, 0.11], fontWeight: 1),
        Badge(name: "Veterinarian", symbol: "fan.fill", color: [0.94, 0.32, 0.38], fontWeight: 1),
        Badge(name: "Chef", symbol: "car", color: [0.76, 0.98, 0.59], fontWeight: 1),
        Badge(name: "Scientist", symbol: "house.fill", color: [0.28, 0.51, 0.34], fontWeight: 1),
        Badge(name: "Pilot", symbol: "globe.americas", color: [0.78, 0.13, 0.17], fontWeight: 1),
        Badge(name: "Dancer", symbol: "figure.walk", color: [0.64, 0.14, 0.64], fontWeight: 1),
        Badge(name: "Engineer", symbol: "airplane", color: [0.87, 0.58, 0.06], fontWeight: 1),
        Badge(name: "Singer", symbol: "fan.fill", color: [0.20, 0.50, 0.48], fontWeight: 1),
        Badge(name: "Writer", symbol: "car", color: [0.51, 0.09, 0.30], fontWeight: 1),
        Badge(name: "Architect", symbol: "house.fill", color: [0.17, 0.70, 0.58], fontWeight: 1),
        Badge(name: "Nurse", symbol: "globe.americas", color: [0.76, 0.79, 0.63], fontWeight: 1),
        Badge(name: "Superhero", symbol: "figure.walk", color: [0.62, 0.22, 0.38], fontWeight: 1),
        Badge(name: "Explorer", symbol: "airplane", color: [0.63, 0.73, 0.18], fontWeight: 1),
        Badge(name: "Paleontologist", symbol: "fan.fill", color: [0.83, 0.59, 0.75], fontWeight: 1),
        Badge(name: "Fashion Designer", symbol: "car", color: [0.12, 0.92, 0.09], fontWeight: 1)
    ]
    
    @Published var secondBadgeList = [
        Badge(name: "Skydiving", symbol: "figure.walk", color: [0.59, 1.00, 0.91], fontWeight: 1),
        Badge(name: "Scuba Diving", symbol: "airplane", color: [0.48, 0.19, 0.30], fontWeight: 1),
        Badge(name: "Rock Climbing", symbol: "fan.fill", color: [0.62, 0.46, 0.57], fontWeight: 1),
        Badge(name: "Bungee Jumping", symbol: "car", color: [0.24, 0.14, 0.18], fontWeight: 1),
        Badge(name: "Hot Air Ballooning", symbol: "house.fill", color: [0.54, 0.11, 0.81], fontWeight: 1),
        Badge(name: "Paragliding", symbol: "globe.americas", color: [0.73, 0.54, 0.50], fontWeight: 1),
        Badge(name: "Surfing", symbol: "figure.walk", color: [0.87, 0.74, 0.89], fontWeight: 1),
        Badge(name: "Skiing/Snowboarding", symbol: "airplane", color: [0.18, 0.34, 0.11], fontWeight: 1),
        Badge(name: "Sailing", symbol: "fan.fill", color: [0.94, 0.32, 0.38], fontWeight: 1),
        Badge(name: "Horseback Riding", symbol: "car", color: [0.76, 0.98, 0.59], fontWeight: 1),
        Badge(name: "Kayaking", symbol: "house.fill", color: [0.28, 0.51, 0.34], fontWeight: 1),
        Badge(name: "Whitewater Rafting", symbol: "globe.americas", color: [0.78, 0.13, 0.17], fontWeight: 1),
        Badge(name: "Zip Lining", symbol: "figure.walk", color: [0.64, 0.14, 0.64], fontWeight: 1),
        Badge(name: "Hang Gliding", symbol: "airplane", color: [0.87, 0.58, 0.06], fontWeight: 1),
        Badge(name: "Windsurfing", symbol: "fan.fill", color: [0.20, 0.50, 0.48], fontWeight: 1),
        Badge(name: "Kiteboarding", symbol: "car", color: [0.51, 0.09, 0.30], fontWeight: 1),
        Badge(name: "Mountain Biking", symbol: "house.fill", color: [0.17, 0.70, 0.58], fontWeight: 1),
        Badge(name: "Hiking the Appalachian Trail", symbol: "globe.americas", color: [0.76, 0.79, 0.63], fontWeight: 1),
        Badge(name: "Backpacking through Europe", symbol: "figure.walk", color: [0.62, 0.22, 0.38], fontWeight: 1),
        Badge(name: "Learning a New Language", symbol: "airplane", color: [0.63, 0.73, 0.18], fontWeight: 1),
        Badge(name: "Playing a Musical Instrument", symbol: "fan.fill", color: [0.83, 0.59, 0.75], fontWeight: 1),
        Badge(name: "Photography", symbol: "car", color: [0.12, 0.92, 0.09], fontWeight: 1),
        Badge(name: "Painting/Drawing", symbol: "house.fill", color: [0.65, 0.72, 0.32], fontWeight: 1),
        Badge(name: "Cooking/Baking", symbol: "globe.americas", color: [0.48, 0.50, 0.78], fontWeight: 1),
        Badge(name: "Gardening", symbol: "figure.walk", color: [0.85, 0.21, 0.84], fontWeight: 1),
        Badge(name: "Yoga/Meditation", symbol: "airplane", color: [0.77, 0.99, 0.55], fontWeight: 1),
        Badge(name: "Volunteering for a Cause", symbol: "fan.fill", color: [0.12, 0.98, 0.88], fontWeight: 1),
        Badge(name: "Writing a Book", symbol: "car", color: [0.98, 0.89, 0.68], fontWeight: 1),
        Badge(name: "Traveling to Every Continent", symbol: "house.fill", color: [0.66, 0.73, 0.16], fontWeight: 1),
        Badge(name: "Learning to Fly a Plane", symbol: "globe.americas", color: [0.74, 0.83, 0.89], fontWeight: 1)
    ]
    
    init() {
        loadBadges()
    }

    func saveBadges() {
        do {
            let data = try JSONEncoder().encode(selectedBadges)
            UserDefaults.standard.set(data, forKey: BadgeModel.key)
        } catch {
            print("Error saving badges: \(error.localizedDescription)")
        }
    }

    func loadBadges() {
        if let data = UserDefaults.standard.data(forKey: BadgeModel.key) {
            do {
                selectedBadges = try JSONDecoder().decode([Badge].self, from: data)
            } catch {
                print("Error loading badges: \(error.localizedDescription)")
            }
        }
    }

    func addBadge(_ badge: Badge) {
        selectedBadges.append(badge)
        saveBadges()
    }

    func removeBadge(_ badge: Badge) {
        if let index = selectedBadges.firstIndex(of: badge) {
            selectedBadges.remove(at: index)
            saveBadges()
        }
    }
    
    func removeAll() {
        selectedBadges = []
        }
}

func changeColorToArray(_ color: Color) -> [CGFloat] {
    let uiColor = UIColor(color)
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    return [red, green, blue, alpha]
}

func changeArrayToColor(_ array: [CGFloat]) -> Color {
    guard array.count >= 3 else {
        return Color.black
    }
    
    let red = array[0]
    let green = array[1]
    let blue = array[2]
    
    let alpha: CGFloat = array.count > 3 ? array[3] : 1.0
    
    return Color(red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
}

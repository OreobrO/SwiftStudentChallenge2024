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
        Badge(name: "Astronaut", symbol: "globe.americas", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Firefighter", symbol: "flame", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Doctor", symbol: "heart.text.square", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Teacher", symbol: "person.2.square.stack", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Police Officer", symbol: "shield", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Actor/Actress", symbol: "person.fill.badge.plus", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Professional Athlete", symbol: "sportscourt", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Artist", symbol: "paintpalette", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Veterinarian", symbol: "hare", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Chef", symbol: "fork.knife", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Scientist", symbol: "person.fill.questionmark", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Pilot", symbol: "airplane", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Dancer", symbol: "music.note", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Engineer", symbol: "gear", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Singer", symbol: "mic", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Writer", symbol: "book", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Architect", symbol: "building.columns", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Nurse", symbol: "cross", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Superhero", symbol: "bolt.heart", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Explorer", symbol: "binoculars", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Paleontologist", symbol: "leaf.arrow.circlepath", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Fashion Designer", symbol: "scissors", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Pirate", symbol: "sun.max", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Race Car Driver", symbol: "car", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Cowboy/Cowgirl", symbol: "star.circle", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Princess/Prince", symbol: "crown", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Magician", symbol: "wand.and.stars", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Rock Star", symbol: "guitars", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Space Explorer", symbol: "paperplane", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Detective", symbol: "magnifyingglass", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Fairy", symbol: "wand.and.rays", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Monster Truck Driver", symbol: "car", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Zookeeper", symbol: "leaf", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Game Developer", symbol: "gamecontroller.fill", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Vampire", symbol: "bat", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Mermaid/Merman", symbol: "waveform.path.ecg", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "President", symbol: "square.and.line.vertical.and.square", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Spy", symbol: "heart.text.square", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Wizard", symbol: "star", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Toy Maker", symbol: "cube.box", color: [0.54, 0.70, 0.70], fontWeight: 1)
    ]

    
    @Published var secondBadgeList = [
        Badge(name: "Reading", symbol: "book", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Photography", symbol: "camera", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Gardening", symbol: "leaf", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Cooking", symbol: "flame", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Traveling", symbol: "airplane", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Painting", symbol: "paintpalette", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Hiking", symbol: "figure.walk", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Playing Music", symbol: "guitars", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Dancing", symbol: "music.note", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Yoga", symbol: "person.fill", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Fishing", symbol: "seal", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Camping", symbol: "tent", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Skiing", symbol: "snow", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Playing Sports", symbol: "sportscourt", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Collecting", symbol: "star", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Writing", symbol: "pencil", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Gaming", symbol: "gamecontroller", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Bird Watching", symbol: "antenna.radiowaves.left.and.right", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Knitting", symbol: "text.insert", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Cycling", symbol: "bicycle", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Running", symbol: "figure.walk", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Drawing", symbol: "pencil.and.outline", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Singing", symbol: "mic", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Watching Movies", symbol: "film", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "DIY Projects", symbol: "hammer", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Playing Chess", symbol: "gamecontroller", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Learning Languages", symbol: "text.book.closed", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Meditation", symbol: "leaf", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "DIY Electronics", symbol: "bolt", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Home Decor", symbol: "house", color: [0.54, 0.55, 0.77], fontWeight: 1)
    ]

    @Published var thirdBadgeList = [
        Badge(name: "Public Speaking", symbol: "megaphone", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Coding", symbol: "chevron.left.slash.chevron.right", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Creative Writing", symbol: "pencil.and.outline", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Financial Literacy", symbol: "dollarsign.circle", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Critical Thinking", symbol: "lightbulb", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Time Management", symbol: "timer", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Negotiation Skills", symbol: "hand.raised", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Leadership Skills", symbol: "person.3", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Problem Solving", symbol: "puzzlepiece", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Networking", symbol: "person.2.circle", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Emotional Intelligence", symbol: "figure.walk", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Mindfulness", symbol: "heart.text.square", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Learning a New Language", symbol: "text.book.closed", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Cooking Techniques", symbol: "flame", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Graphic Design", symbol: "paintpalette", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Web Development", symbol: "globe", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Digital Marketing", symbol: "chart.bar", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Photography Techniques", symbol: "camera", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Music Production", symbol: "music.note", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Investing Strategies", symbol: "chart.pie", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Self-Defense", symbol: "shield", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Entrepreneurship", symbol: "lightbulb", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Healthy Cooking", symbol: "leaf", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Personal Finance Management", symbol: "dollarsign.square", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Stress Management", symbol: "heart.text.square", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Artificial Intelligence", symbol: "brain", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Mediation Skills", symbol: "hand.raised", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Creative Problem Solving", symbol: "lightbulb", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Networking Skills", symbol: "person.2.circle", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Personal Branding", symbol: "person.fill.badge.plus", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Interpersonal Communication", symbol: "message", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Data Analysis", symbol: "chart.bar", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Decision Making", symbol: "star", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Building a Personal Website", symbol: "globe", color: [0.90, 0.74, 0.61], fontWeight: 1),
        Badge(name: "Blogging", symbol: "text.alignleft", color: [0.72, 0.83, 0.97], fontWeight: 1),
        Badge(name: "Effective Teaching Strategies", symbol: "person.2.square.stack", color: [0.54, 0.55, 0.77], fontWeight: 1),
        Badge(name: "Understanding Cryptocurrency", symbol: "bitcoinsign.circle", color: [0.86, 0.49, 0.49], fontWeight: 1),
        Badge(name: "Learning to Swim", symbol: "lifepreserver", color: [0.83, 0.85, 0.60], fontWeight: 1),
        Badge(name: "Bicycle Maintenance", symbol: "bicycle", color: [0.54, 0.70, 0.70], fontWeight: 1),
        Badge(name: "Yoga Practice", symbol: "figure.stand", color: [0.90, 0.74, 0.61], fontWeight: 1)
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
        }
        if let index = firstSelectedBadges.firstIndex(of: badge) {
            firstSelectedBadges.remove(at: index)
        }
        if let index = secondSelectedBadges.firstIndex(of: badge) {
            secondSelectedBadges.remove(at: index)
        }
        if let index = thirdSelectedBadges.firstIndex(of: badge) {
            thirdSelectedBadges.remove(at: index)
        }
        saveBadges()
    }
    
    func removeAll() {
        selectedBadges = []
        firstSelectedBadges = []
        secondSelectedBadges = []
        thirdSelectedBadges = []
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

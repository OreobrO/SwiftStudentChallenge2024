//
//  BadgeModel.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/12/24.
//

import SwiftUI

class BadgeModel: ObservableObject {
    @Published var badges: [Badge] = []
    @Published var tempBadge = Badge(name: "", symbol: "", color: [], fontWeight: 1)
    @Published var symbolList: [String] = [
    "figure.walk",
    "airplane",
    "fan.fill",
    "car",
    "house.fill",
    "globe.americas"
    ]

    static let key = "savedBadges"

    init() {
        loadBadges()
    }

    func saveBadges() {
        do {
            let data = try JSONEncoder().encode(badges)
            UserDefaults.standard.set(data, forKey: BadgeModel.key)
        } catch {
            print("Error saving badges: \(error.localizedDescription)")
        }
    }

    func loadBadges() {
        if let data = UserDefaults.standard.data(forKey: BadgeModel.key) {
            do {
                badges = try JSONDecoder().decode([Badge].self, from: data)
            } catch {
                print("Error loading badges: \(error.localizedDescription)")
            }
        }
    }

    func addBadge(_ badge: Badge) {
        badges.append(badge)
        saveBadges()
    }

    func removeBadge(_ badge: Badge) {
        if let index = badges.firstIndex(of: badge) {
            badges.remove(at: index)
            saveBadges()
        }
    }
    
    func removeAll() {
            badges = []
        }
}

    
//class BadgeModel: ObservableObject {
//    
//    @Published var badges: [Badge] = [Badge(name: "Hello", symbol: "square.and.arrow.up", color: Color.red)]
//    
//    // Define the file URL where badges will be stored
//    let badgesFileURL: URL
//    
//    init() {
//        // Get the document directory URL
//        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
//            self.badgesFileURL = documentDirectory.appendingPathComponent("badges.plist")
//        } else {
//            // Fallback URL
//            self.badgesFileURL = URL(fileURLWithPath: "")
//            print("Error: Couldn't determine document directory.")
//        }
//        
//        // Load badges from disk
//        loadBadges()
//    }
//    
//    /// Load badges from disk
//    func loadBadges() {
//        if let data = try? Data(contentsOf: badgesFileURL) {
//            if let loadedBadges = try? PropertyListDecoder().decode([Badge].self, from: data) {
//                self.badges = loadedBadges
//            }
//        }
//    }
//    
//    /// Save badges to disk
//    func saveBadges() {
//        if let data = try? PropertyListEncoder().encode(badges) {
//            try? data.write(to: badgesFileURL)
//        }
//    }
//    
//    /// Adds a badge to the data collection and saves it to disk.
//    func addBadge(_ badge: Badge) {
//        badges.append(badge)
//        saveBadges()
//    }
//    
//    /// Removes a badge from the data collection and saves the updated collection to disk.
//    func removeBadge(_ badge: Badge) {
//        if let index = badges.firstIndex(of: badge) {
//            badges.remove(at: index)
//            saveBadges()
//        }
//    }
//}

//
//  Profile.swift
//  Landmarks
//
//  Created by Faisal Manzer on 14/12/20.
//

import Foundation


struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.spring
    var goalDate = Date()

    static let `default` = Profile(username: "mongose")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        var id: String { self.rawValue }
    }
}

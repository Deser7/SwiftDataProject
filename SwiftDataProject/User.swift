//
//  User.swift
//  SwiftDataProject
//
//  Created by Наташа Спиридонова on 08.08.2025.
//

import Foundation
import SwiftData

@Model
final class User {
    var name: String
    var city: String
    var joinDate: Date
    
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}

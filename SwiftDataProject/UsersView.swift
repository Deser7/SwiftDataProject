//
//  UsersView.swift
//  SwiftDataProject
//
//  Created by Наташа Спиридонова on 09.08.2025.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                
                Spacer()
                
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .onAppear(perform: addSample)
    }
    
    init(minimumJoinDate: Date, sortOrder: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User> { user in
            user.joinDate >= minimumJoinDate
        }, sort: \User.name)
    }
    
    func addSample() {
        let userOne = User(
            name: "Piper Chapman",
            city: "New York",
            joinDate: .now
        )
        let jobOne = Job(name: "Organize sock drawer", priority: 3)
        let jobTwo = Job(name: "Make plans with Alex", priority: 4)
        
        modelContext.insert(userOne)
        
        userOne.jobs.append(jobOne)
        userOne.jobs.append(jobTwo)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sortOrder: [SortDescriptor(\User.name)])
        .modelContainer(for: User.self)
}

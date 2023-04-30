//
//  ContentView.swift
//  UserDisplay
//
//  Created by Steven Gustason on 4/29/23.
//

// Note: Left off needing to update ListView to have a List that uses ForEach to show all of the user data, then need to populate DetailView

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            if users.count == 0 {
                DownloadView(users: $users)
            } else {
                ListView()
            }
        }
        .navigationTitle("User Display")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

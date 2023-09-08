//
//  JournaiApp.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import SwiftUI
import SwiftData
@main
struct JournaiApp: App {
	
	@StateObject private var viewModel = JournalViewModel()
	
    var body: some Scene {
        WindowGroup {
			NavigationView{
				ContentView()
					.environmentObject(viewModel)
			}
        }
		.modelContainer(for: JournalEntry.self)
    }
}

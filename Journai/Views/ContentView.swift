//
//  ContentView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@EnvironmentObject var viewModel: JournalViewModel
    var body: some View {
        
		TabView{
			JournalView()
				.environmentObject(viewModel)
				.tabItem{
					Label("Journal", systemImage: "book.pages")
				}
			
			JournalView()
				.environmentObject(viewModel)
				.tabItem{
					Label("Summaries", systemImage: "book.fill")
				}
			
			SettingsView()
				.tabItem{
					Label("Settings", systemImage: "gearshape.fill")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(JournalViewModel())
    }
}

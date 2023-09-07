//
//  JournalView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import SwiftUI




struct JournalView: View {
	@EnvironmentObject var viewModel: JournalViewModel
	@State private var isPresentingEntrySheet = false

    var body: some View {
		
		List{
			ForEach(viewModel.entries){ entry in
				NavigationLink {
					JournalEntryView(entry:entry)
				} label: {
					Text(entry.title)
				}				
			}
		}
		
		VStack {
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundColor(.red)
			Text("Hello, world!")
		}
		.padding()
    }
}

#Preview {
    JournalView()
}

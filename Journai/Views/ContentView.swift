//
//  ContentView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var viewModel: JournalViewModel
    var body: some View {
        JournalView()
			.environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  JournalEntryView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import SwiftUI

struct JournalEntryView: View {
	let entry: JournalEntry
	
    var body: some View {
		VStack(alignment: .leading){
			Text(entry.title)
				.font(.title)
				.bold()
			Text("\(Date(timeIntervalSince1970: entry.dateCreated.timeIntervalSince1970).formatted(date: .abbreviated, time: .shortened))")
			Text(entry.body)
				.font(.body)
				.padding(.top)
			
			Spacer()
			
		}
    }
}

#Preview {
	JournalEntryView(entry:JournalEntry(title: "title", body: "body"))
}

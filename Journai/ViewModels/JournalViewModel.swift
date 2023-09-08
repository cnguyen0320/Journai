//
//  JournalViewModel.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import Foundation

// Create a view model to manage the journal entries
class JournalViewModel: ObservableObject {
	
	// track JournalEntries in an array
	@Published var entries: [JournalEntry] = []
	@Published var showingNewJournalView: Bool = false
	
	// Function to add a new journal entry
	func addEntry(title: String, body: String) {
		let newEntry = JournalEntry(
			title: title,
			body: body
		)
		entries.append(newEntry)
	}
	
	// Function to update an existing journal entry
	func updateEntry(_ entry: JournalEntry, title: String, body: String) {
		if let index = entries.firstIndex(where: { $0.id == entry.id }) {
			entries[index].title = title
			entries[index].body = body
			entries[index].dateModified = Date()
		}
	}
	
	// Function to delete a journal entry
	func deleteEntry(at indexSet: IndexSet) {
		entries.remove(atOffsets: indexSet)
	}
}

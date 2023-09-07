//
//  JournalEntry.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import Foundation

struct JournalEntry: Identifiable {
	let id = UUID()
	var title: String
	var body: String
	var dateCreated: Date
	var dateModified: Date
}

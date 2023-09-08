//
//  JournalEntry.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import Foundation
import SwiftData

@Model
final class JournalEntry{
	let id = UUID()
	var title: String
	var body: String
	var dateCreated: Date
	var dateModified: Date
	
	init(title: String, body: String){
		self.id = UUID()
		self.title = title
		self.body = body
		self.dateCreated = Date.now
		self.dateModified = Date.now
		
	}
}

extension JournalEntry: Identifiable {}

extension JournalEntry: Hashable {
	static func == (e1: JournalEntry, e2: JournalEntry) -> Bool{
		e1.id == e2.id
	}
	
	func hash(into hasher: inout Hasher){
		hasher.combine(id)
	}
}


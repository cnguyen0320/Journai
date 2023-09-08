//
//  NewJournalViewViewModel.swift
//  Journai
//
//  Created by Chris Nguyen on 9/8/23.
//

import Foundation

class NewJournalViewViewModel: ObservableObject{
	
	@Published var title: String = ""
	@Published var body: String = ""
	
	func save(){
		
		guard hasContent() else{
			return
		}
		
		let newEntry = JournalEntry(title: title, 
									body: body
		)
		
		
		print(newEntry)
		
	}
	
	func hasContent() -> Bool{
		guard !title.trimmingCharacters(in: .whitespaces).isEmpty || !body.trimmingCharacters(in: .whitespaces).isEmpty else{
			return false
		}
		
		return true
	}
	
}

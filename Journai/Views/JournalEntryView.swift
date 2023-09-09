//
//  JournalEntryView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import SwiftUI

struct JournalEntryView: View {
	@Environment(\.modelContext) private var modelContext
	
	@Binding var journalEntryPresented: Bool
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
			
			HStack{
				
				Button("Dismiss"){
					journalEntryPresented = false
				}
				.foregroundColor(.secondary)
				.padding()
				
				Spacer()
				
				Button("Delete Entry"){
					modelContext.delete(entry)
					journalEntryPresented = false
				}
				.foregroundColor(.red)
				.padding()
			}.padding()
			
			
			
			
		}
		.padding()
    }
}

#Preview {
	JournalEntryView(journalEntryPresented: Binding(get:{
		return true
		   
	   }, set:{
		   _ in
		   
	   }), entry:JournalEntry(title: "title", body: "body"))
}

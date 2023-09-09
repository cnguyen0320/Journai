//
//  NewJournalView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/8/23.
//

import SwiftUI

struct NewJournalView: View {
    
	@StateObject var viewModel = NewJournalViewViewModel()
	@Binding var newEntryPresented: Bool
	@Environment(\.modelContext) private var modelContext
	
	var body: some View {
		
		VStack{
			VStack{
				Button{
					print("prompted")
				}label:{
					Text("Prompt Me")
						.font(.title3)
				}
				
				Text("")
					.font(.body)
			}
			
			TextField("Title", text:$viewModel.title)
				.textFieldStyle(.automatic)
				.font(.largeTitle)
			
			TextEditor(text:$viewModel.body)
				.textFieldStyle(.plain)
				.font(.title3)
			
			Spacer()
			
			saveButton
			
		}
		.padding(.horizontal)
		.padding(.top)
    }
	
	@ViewBuilder
	var saveButton : some View{
		Button{
			// save and close the view
			let newEntry = JournalEntry(title: viewModel.title, body: viewModel.body)
			modelContext.insert(newEntry)
			newEntryPresented = false
		} label:{
			Text("Save")
				.font(.largeTitle)
		}
	}
}

#Preview {
    NewJournalView(newEntryPresented: Binding(get:{
		return true
		   
	   }, set:{
		   _ in
		   
	   }))

}

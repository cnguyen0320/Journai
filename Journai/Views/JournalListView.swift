//
//  JournalView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/7/23.
//

import SwiftUI
import SwiftData

struct JournalView: View {
	@EnvironmentObject var viewModel: JournalViewModel
	@Query private var entries: [JournalEntry]
	
	var body: some View {
		NavigationView{
			
			VStack{
				
					Buttons
					
					List{
						ForEach(entries){ entry in
							NavigationLink {
								JournalEntryView(entry:entry)
							} label: {
								VStack{
									Text(entry.title)
										.bold()
									Text("\(Date(timeIntervalSince1970: entry.dateCreated.timeIntervalSince1970).formatted(date: .numeric, time: .omitted))")
										.foregroundColor(.secondary)
								}
							}
						}
					}
				
			}
			.navigationTitle("Journai")
			
			.sheet(isPresented: $viewModel.showingNewJournalView){ // provides the sheet for new item
				NewJournalView(newEntryPresented: $viewModel.showingNewJournalView)
			}
			
			
		}
	}
	
	
	@ViewBuilder
	var Buttons : some View{
		
		HStack{
			
			
			Button {
				viewModel.showingNewJournalView = true
			} label:{
				ZStack{
					RoundedRectangle(cornerRadius: 10.0)
						.foregroundColor(.blue)
					Text("New Entry")
						.foregroundColor(.white)
						.bold()
					
				}
			}
			
			Button {
				viewModel.showingNewJournalView = true
			} label:{
				ZStack{
					RoundedRectangle(cornerRadius: 10.0)
						.foregroundColor(.black)
					Text("Get a Prompt")
						.foregroundColor(.white)
						.bold()
				}
			}
		}
		.padding()
	}
}

#Preview {
    JournalView()
		.environmentObject(JournalViewModel())
		.modelContainer(previewContainer)
}

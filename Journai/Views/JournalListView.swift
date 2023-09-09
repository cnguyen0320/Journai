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
	@Query(sort:\JournalEntry.dateCreated,order: .reverse) private var entries: [JournalEntry]
	
	var body: some View {

		NavigationView{
			VStack{
				List{
					ForEach(entries){ entry in
						Button {
							viewModel.selectedEntry = entry
							viewModel.showingViewJournalEntry = true
						} label: {
							VStack(alignment: .leading){
								Text(entry.title)
									.foregroundColor(.primary)
									.bold()
								Text("\(Date(timeIntervalSince1970: entry.dateCreated.timeIntervalSince1970).formatted(date: .numeric, time: .omitted))")
									.foregroundColor(.secondary)
							}
						}
					}
				}
				.listStyle(.plain)
				
			}
			
			.navigationTitle("All Entries")
			.toolbar{
				Button{
					viewModel.showingNewJournalView = true
				} label:{
					Image(systemName:"plus")
				}
			}
			.sheet(isPresented: $viewModel.showingNewJournalView){ // provides the sheet for new item
				NewJournalView(newEntryPresented: $viewModel.showingNewJournalView)
			}
			.sheet(isPresented: $viewModel.showingViewJournalEntry){
				JournalEntryView(journalEntryPresented: $viewModel.showingViewJournalEntry, entry: viewModel.selectedEntry!)
			}
		}
		
	}
}

#Preview {
    JournalView()
		.environmentObject(JournalViewModel())
		.modelContainer(previewContainer)
}

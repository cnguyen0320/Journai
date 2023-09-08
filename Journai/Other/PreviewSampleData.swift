//
//  PreviewSampleData.swift
//  Journai
//
//  Created by Chris Nguyen on 9/8/23.
//

import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
	do {
		let container = try ModelContainer(
			for: JournalEntry.self
		)
		for entry in SampleJournal.contents {
			container.mainContext.insert(entry)
		}
		return container
	} catch {
		fatalError("Failed to create container")
	}
}()

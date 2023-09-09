//
//  SettingsView.swift
//  Journai
//
//  Created by Chris Nguyen on 9/8/23.
//

import SwiftUI

struct SettingsView: View {
	@AppStorage("apiKey") private var apiKey: String = ""
	@State private var tempApiKey: String = ""
	
	var body: some View {
		NavigationView{
			
			
			VStack(alignment: .leading){
				
				Text("Collect and enter your API key to use the AI features.")
					.padding()
					.font(.headline)
					
				Form{
					
					Section(header: Text("API Key")) {
						HStack{
							
							SecureField("Enter API Key", text: $tempApiKey)
								.autocorrectionDisabled()
								.autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
							
							PasteButton(payloadType: String.self) { strings in
								tempApiKey = strings[0]
							}
							.labelStyle(IconOnlyLabelStyle())
							.tint(Color.accentColor)
						
						}
					}
					
					Button{
						// copy field over the saved API key
						apiKey = tempApiKey;
						
					}label:{
						HStack{
							
							Text("Save Key")
						}
						
						
					}
					.font(.title2)
					
				}
				
			}
			.navigationTitle("Settings")
		}
	}
}

#Preview {
    SettingsView()
}

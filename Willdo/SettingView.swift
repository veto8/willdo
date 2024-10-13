//
//  ContentView.swift
//  Willdo
//
//  Created by veto on 29/1/2567 BE.
//

import Setting
import SwiftUI


struct SettingView: View {
    @ObservedObject var vm = NoteViewModel()
    @State private var title = ""
    @State private var content = ""
    @State private var isActive = false

    @AppStorage("host") var host = ""
    @AppStorage("user") var user = ""
    @AppStorage("password") var password = ""
    @AppStorage("couchdb") var couchdb = false
    @AppStorage("sync_data") var sync_data = false
   // @AppStorage("userInput") var sync_data = ""
    @AppStorage("languageIndex") var languageIndex = 0
    //@State private var username = ""
    //@State private var password = ""
    @AppStorage("index") var index = 0
    var body: some View {
        NavigationView {
            
            //https://www.codespeedy.com/read-text-from-a-textfield-in-swiftui/
            Form {
                Section(header: Text("CouchDB Sync")) {
                    
                    Toggle("Sync Data", isOn: $sync_data)
                    
               
                    TextField("Type here", text: $host)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                }
                
                
            }
            
            
        }
            }
    
    
    
}


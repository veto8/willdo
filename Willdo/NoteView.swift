//
//  ContentView.swift
//  Willdo
//
//  Created by veto on 29/1/2567 BE.
//

import SwiftUI


struct NoteView: View {
    @ObservedObject var vm = NoteViewModel()
    @State private var title = ""
    @State private var content = ""
    //@Binding var content2 : Int = 0
    @State private var isActive = false
    //@State private var username = ""
    //@State private var password = ""
    var body: some View {
        NavigationView {
            VStack {
                VStack(
                    spacing: 8
                ) {
                     ZStack{
                        
                        HStack{
                             Spacer()
                        }
                        
                        HStack{
                            Image(
                                systemName: "tortoise.fill"
                            )
                            
                            .foregroundStyle(
                                .tint
                            )
                            
                            .symbolRenderingMode(
                                .hierarchical
                            )
                        }
                        
                        HStack{
                            Spacer()
                            NavigationLink(
                                destination: SettingView()
                            ) {
                                
                                Image(
                                    systemName: "gearshape.fill"
                                )
                                
                                .foregroundStyle(
                                    .gray
                                )
                                
                                .symbolRenderingMode(
                                    .hierarchical
                                )
                                
                            }
                        }
                        
                    }
                    
                    Text(
                        "Will Do List"
                    )
                    
                }
                
                .font(
                    .title
                )
                
                
     
                //https://developer.apple.com/tutorials/develop-in-swift/create-dynamic-content
                List {
                    ForEach(
                        vm.notes
                    ) { note in
                        Text(
                            note.title
                        ).onTapGesture{
                            //vm.tapNote(
                            //    note.content
                            //)
                            self.content = note.content
                        }
                        
                    }.onDelete(perform: vm.delete_item)
                }
          
                
                Label(
                    "Message",
                    systemImage: "pencil.line"
                )
                //https://developer.apple.com/documentation/swiftui/texteditor
                TextEditor(
                    text:$content
                    //text: Binding(get: {vm.content }, set: {vm.content = $0})
                )
                //.textEditorStyle(RoundedBorderTextEditorStyle() )
                .lineSpacing(
                    0.1
                )
                
                .padding(
                    1
                )
                .background(
                    .white.opacity(
                        0.2
                    )
                )
                .border(
                    Color.gray,
                    width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/
                )
                .padding(
                    2
                )
                
                //Label("Title", systemImage: "star").padding(1)
                
                
                //https://developer.apple.com/documentation/SwiftUI/TextField
                TextField(
                    "Enter Title (Optional) ...",
                    text:$title
                )
                .textFieldStyle(
                    RoundedBorderTextFieldStyle()
                )
                .padding(
                    5
                )
                .background(
                    .white.opacity(
                        0.2
                    )
                )
                .cornerRadius(
                    2.5
                )
                
                
                
                //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                // .padding(2)            //.disableAutocorrection(true)
                
                Button(action:{
                    vm.add_note(
                        $title.wrappedValue,
                        $content.wrappedValue
                    )
                    title = ""
                    content = ""
                    
                    
                }){
                    Text(
                        "Add Note"
                    ).frame(
                        minWidth:0,
                        maxWidth: .infinity
                    )
                }
                //  .background(.green.opacity(1))
                
                .buttonStyle(
                    BorderedProminentButtonStyle()
                )
                .padding(
                    5
                )
            }
        }
    }
    

}

#Preview {
    NoteView()
}



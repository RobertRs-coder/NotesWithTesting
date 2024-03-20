//
//  CreateNoteView.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 9/3/24.
//

import SwiftUI

struct CreateNoteView: View {
    @StateObject var viewModel: NotesViewModel
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("Title"), axis: .vertical)
                        .accessibilityIdentifier("CreateNoteTitleTextField")
                    TextField("", text: $text, prompt: Text("Text"), axis: .vertical)
                        .accessibilityIdentifier("CreateNoteTextTextField")
                } footer: {
                    Text("*The title is mandatory")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Close")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                            viewModel.createNote(title: title, text: text)
                        dismiss()
                        
                    } label: {
                        Text("Create Note")
                            .bold()
                    }
                    .accessibilityIdentifier("CreateNoteButton")
                }
            }
            .navigationTitle("New Note")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    CreateNoteView(viewModel: .init(notes: []))
}

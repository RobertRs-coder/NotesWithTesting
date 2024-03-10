//
//  UpdateNoteView.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 10/3/24.
//

import SwiftUI

struct UpdateNoteView: View {
    @StateObject var viewModel: NotesViewModel
    let id: UUID
    @State var title: String = ""
    @State var text: String = ""
    
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("", text: $title, prompt: Text("Title"), axis: .vertical)
                    TextField("", text: $text, prompt: Text("Text"), axis: .vertical)
                }
            }
            Button {
                viewModel.removeNote(id: id)
            } label: {
                Text("Button")
                    .foregroundStyle(.gray)
                    .underline()
            }
            .buttonStyle(.borderless)
            Spacer()
        }
        .background(Color(.systemBackground))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.updateNote(id: id, newTitle: title, newText: text)
                    dismiss()
                    
                } label: {
                    Text("Create Note")
                        .bold()
                }
            }
        }
        .navigationTitle("Modify Note")
    }
}

#Preview {
    UpdateNoteView(viewModel: .init(), id: .init(), title: "Note 1", text: "Note 1 description")
}

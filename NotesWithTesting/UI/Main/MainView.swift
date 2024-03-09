//
//  MainView.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 9/3/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject var viewModel: NotesViewModel = .init()
    //    init() { self._viewModel = StateObject(wrappedValue: NotesViewModel()) }
    @State var showCreateNote: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(value: note) {
                        VStack(alignment: .leading) {
                            Text(note.title)
                                .foregroundStyle(.primary)
                            Text(note.getText)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .status) {
                    Button {
                        showCreateNote.toggle()
                    } label: {
                        Label("Create Note", systemImage: "square.and.pencil")
                            .labelStyle(.titleAndIcon)
                    }
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    .bold()
                }
            }
            .popover(isPresented: $showCreateNote) {
                CreateNoteView(viewModel: viewModel)
                    .presentationCompactAdaptation(.fullScreenCover)
            }
            //            .fullScreenCover(isPresented: $showCreateNote) {
            //                CreateNoteView(viewModel: viewModel)
            //            }
            .navigationTitle("Notes")

        }
        
    }
}

#Preview {
    MainView(
        viewModel: NotesViewModel(
            notes: [
                .init(
                    title: "First Note",
                    text: "Testing first note",
                    createdAt: .now
                ),
                .init(
                    title: "Second Note",
                    text: "Testing second note",
                    createdAt: .now
                )
            ]
        )
    )
}

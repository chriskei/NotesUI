//
//  NoteRow.swift
//  Notes
//
//  Created by Longe, Chris on 1/5/20.
//  Copyright © 2020 Arshad, Fatima. All rights reserved.
//

import SwiftUI

struct NoteRow: View {
    @Binding var notes: [Note]
    let note: Note

    private var index: Int {
        return notes.firstIndex(where: { noteInList in
            return noteInList.id == note.id
        }) ?? 0
    }

    var body: some View {
        return TextField("take a note", text: $notes[index].title)
    }
}

struct NoteRow_Previews: PreviewProvider {
    static var previews: some View {
        let notes = [
            Note(title: "butter"),
            Note(title: "milk"),
            Note(title: "eggs")
        ]
        return Group {
            // We use .constant() to create a binding with an immutable value
            // that is used to insert data for the preview
            NoteRow(notes: .constant(notes), note: notes[0])
                .previewLayout(.fixed(width: 300, height: 70))
            NoteRow(notes: .constant(notes), note: notes[1])
                .previewLayout(.fixed(width: 414, height: 70))
        }
    }
}

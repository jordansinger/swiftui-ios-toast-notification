//
//  EditView.swift
//  Notification
//
//  Created by Jordan Singer on 12/19/20.
//

import SwiftUI

struct EditView: View {
    @Binding var showEditView: Bool
    @Binding var image: String
    @Binding var title: String
    @Binding var subtitle: String
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Image", selection: $image) {
                    ForEach(SFSymbol.allCases) { Text($0.description).tag($0) }
                }
                
                Section(header: Text("Text")) {
                    TextField("Title", text: $title)
                    TextField("Subtitle", text: $subtitle)
                }
                
            }
            .navigationBarItems(leading: Button(action: { showEditView = false }) { Text("Done").font(.body) })
            .navigationBarTitle("Edit", displayMode: .inline)
        }
        .accentColor(.primary)
    }
}

enum SFSymbol: String, CaseIterable, Identifiable, CustomStringConvertible {
    case none
    case airpods
    case airpodspro
    case headphones
    case applewatch
    case homepod

    var id: String { self.rawValue }
    var description: String { self.rawValue }
}

//
//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}

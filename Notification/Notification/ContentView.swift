//
//  ContentView.swift
//  Notification
//
//  Created by Jordan Singer on 12/19/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var notificationIsVisible = false
    @State var showEditView = false
    
    @State var image = "airpodspro"
    @State var title = "AirPods Pro"
    @State var subtitle = "Connected"
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                Color(colorScheme == .dark ? UIColor.systemBackground : UIColor.secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                ToastView(image: image, title: title, subtitle: subtitle)
                    .offset(y: notificationIsVisible ? 0 : -128)
                    .animation(
                        Animation.spring()
                    )
                    .onTapGesture(perform: toggleVisibility)
            }
            .onAppear(perform: toggleVisibility)
            
            VStack(spacing: 24) {
                Button(action: toggleVisibility) {
                    Text(notificationIsVisible ? "Hide" : "Show")
                        .foregroundColor(.primary)
                }
                
                Button(action: { showEditView.toggle() }) {
                    Text("Edit")
                        .foregroundColor(.primary)
                }
                .sheet(isPresented: $showEditView) {
                    EditView(showEditView: $showEditView, image: $image, title: $title, subtitle: $subtitle)
                }
            }
        }
    }
    
    func toggleVisibility() {
        self.notificationIsVisible.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ToastView.swift
//  Notification
//
//  Created by Jordan Singer on 12/19/20.
//

import SwiftUI

struct ToastView: View {
    @Environment(\.colorScheme) var colorScheme
    var image: String?
    var title: String
    var subtitle: String?
    
    var body: some View {
        HStack(spacing: 16) {
            if image != nil {
                Image(systemName: image!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
            }
            
            VStack(alignment: .center) {
                Text(title)
                    .lineLimit(1)
                    .font(.headline)
                
                if subtitle != nil {
                    Text(subtitle!)
                        .lineLimit(1)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            .padding(image == nil ? .horizontal : .trailing)
        }
        .padding(.horizontal)
        .frame(height: 56)
        .background(Color(colorScheme == .dark ? UIColor.secondarySystemBackground : UIColor.systemBackground))
        .cornerRadius(28)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.08)), radius: 8, x: 0, y: 4)
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 24) {
            ToastView(image: "airpodspro", title: "AirPods Pro", subtitle: "Connected")
            ToastView(title: "Safari pasted from Notes")
            ToastView(image: "headphones", title: "AirPods Max", subtitle: "50%")
                .environment(\.colorScheme, .dark)
        }
    }
}

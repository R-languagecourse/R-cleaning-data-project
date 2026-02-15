//
//  ContentView.swift
//  test-cursor
//
//  Created by Kieran Cagney on 14/02/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "refrigerator.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Spacer()

            HStack(spacing: 8) {
                Image(systemName: "camera.fill")
                    .imageScale(.large)
                Text("fill the fridge")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

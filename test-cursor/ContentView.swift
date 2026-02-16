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
            ZStack(alignment: .top) {
                Text("Fridge-it")
                    .font(.largeTitle)
                HStack {
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.tint)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Image(systemName: "bell.fill")
                        .font(.title2)
                        .foregroundStyle(.tint)
                }
            }
            .padding(.horizontal)
            .padding(.top)

            Spacer()

            VStack(spacing: 12) {
                Image(systemName: "refrigerator.fill")
                    .font(.system(size: 112))
                    .foregroundStyle(.tint)
                    .frame(width: 120)
                Text("my fridge")
            }

            Spacer()

            VStack(spacing: 12) {
                Image(systemName: "camera.fill")
                    .font(.system(size: 112))
                    .foregroundStyle(.tint)
                    .frame(width: 120)
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

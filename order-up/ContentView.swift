//
//  ContentView.swift
//  order-up
//
//  Created by YJ Soon on 14/8/26.
//

import SwiftUI

struct ContentView: View {
    @State private var milo = 0
    @State private var teh = 0
    @State private var toast = 0
    @State private var showOrder = false

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ZStack(alignment: .center) {
                    Ellipse()
                        .fill(Color.brown.opacity(0.60))
                        .frame(width: 280, height: 50)
                        .offset(y: 19)
                    HStack(alignment: .center, spacing: 16) {
                        Text("🥤")
                            .font(.system(size: 48))
                            .rotationEffect(.degrees(-6))
                        Text("🍞")
                            .font(.system(size: 64))
                            .rotationEffect(.degrees(8))
                        Text("🍵")
                            .font(.system(size: 48))
                            .rotationEffect(.degrees(6))
                    }
                }
                Text("Order Up")
                    .font(.largeTitle)
                    .bold()
                
                VStack(spacing: 4) {
                    Text("Kopitiam snacks.")
                        .font(.title3)
                        .foregroundStyle(.secondary)
                    Text("Tap + to add, – to remove.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                RowView(icon: "🥤", name: "Milo", price: 1.50, colour: .orange, count: $milo)
                RowView(icon: "🍵", name: "Teh", price: 1.20, colour: .brown, count: $teh)
                RowView(icon: "🍞", name: "Kaya Toast", price: 2.00, colour: .yellow, count: $toast)
                
                Text("Total  $\(Double(milo) * 1.5 + Double(teh) * 1.2 + Double(toast) * 2.0, specifier: "%.2f")")
                    .font(.title)
                    .bold()
                    .padding(.top, 8)
                
                Button("Place Order") {
                    milo = 0
                    teh = 0
                    toast = 0
                    showOrder = true
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .font(.title2)
                .sheet(isPresented: $showOrder) {
                    VStack(spacing: 12) {
                        Text("Order placed! 🎉")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top, 40)
                        Button("Order more") {
                            showOrder = false
                        }
                        .buttonStyle(.borderedProminent)
                        .font(.title2)
                        .padding(.top, 20)
                    }
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView()
}

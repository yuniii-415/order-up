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
        VStack(spacing: 20) {
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
            HStack {
                Text("🥤  Milo")
                    .font(.title2)
                Text("$1.50")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(milo)")
                    .font(.title)
                    .monospacedDigit()
                Button {
                    if milo > 0 { milo -= 1 }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                }
                Button {
                    milo += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .padding()
            .background(Color.orange.opacity(0.18))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            HStack {
                Text("🍵  Teh")
                    .font(.title2)
                Text("$1.20")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(teh)")
                    .font(.title)
                    .monospacedDigit()
                Button {
                    if teh > 0 { teh -= 1 }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                }
                Button {
                    teh += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .padding()
            .background(Color.brown.opacity(0.15))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            HStack {
                Text("🍞  Kaya Toast")
                    .font(.title2)
                Text("$2.00")
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(toast)")
                    .font(.title)
                    .monospacedDigit()
                Button {
                    if toast > 0 { toast -= 1 }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.largeTitle)
                }
                Button {
                    toast += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .padding()
            .background(Color.yellow.opacity(0.22))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            Text("Total  $\(Double(milo) * 1.5 + Double(teh) * 1.2 + Double(toast) * 2.0, specifier: "%.2f")")
                .font(.title)
                .bold()
                .padding(.top, 8)

            Button("Place Order") {
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

#Preview {
    ContentView()
}

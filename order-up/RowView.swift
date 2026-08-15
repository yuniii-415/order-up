//
//  RowView.swift
//  order-up
//
//  Created by YJ Soon on 14/8/26.
//

import SwiftUI

struct RowView: View {
    let icon: String
    let name: String
    let price: Double
    let colour: Color
    @Binding var count: Int

    var body: some View {
        HStack {
            Text("\(icon)  \(name)")
                .font(.title2)
            Text("$\(price, specifier: "%.2f")")
                .foregroundStyle(.secondary)
            Spacer()
            Text("\(count)")
                .font(.title)
                .monospacedDigit()
            Button {
                if count > 0 { count -= 1 }
            } label: {
                Image(systemName: "minus.circle.fill")
                    .font(.largeTitle)
            }
            Button {
                count += 1
            } label: {
                Image(systemName: "plus.circle.fill")
                    .font(.largeTitle)
            }
        }
        .padding()
        .background(colour.opacity(0.18))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    RowView(icon: "🥤", name: "Milo", price: 1.50, colour: .orange, count: .constant(2))
}
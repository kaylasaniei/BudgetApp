//
//  ContentView.swift
//  Budget
//
//  Created by kayla saniei on 10/27/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let data = [
        (category: "Grocery", total: 500),
        (category: "College", total: 150),
        (category: "Gas", total: 50),
        (category: "Clothes", total: 400),
    ]
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

    @State private var budget = 5000
    
    @State private var selectedMonth: String = "January"
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(months, id: \.self) { month in
                            Text("\(month) '24")
                            .font(.system(size: 20))
                            .padding(7)
                            .onTapGesture {
                                selectedMonth = month
                            }
                            .foregroundStyle(selectedMonth == month ? .black : .gray)
                    }
                }
                .fixedSize()
            }
            
            Chart(data, id: \.category) { category, total in
                    SectorMark(
                        angle: .value("Price", total),
                        innerRadius: .ratio(0.6),
                        outerRadius: .inset(10),
                        angularInset: 1
                    )
                    .cornerRadius(5)
                    .foregroundStyle(by: .value("Price", category))
                }
            .chartBackground { total in
                Text("$\(budget)")
                    .font(.system(size: 40))
            }
            VStack {
                Text("Decide Budget")
                Text("List Purchases")
                Text("Add Purchase")
            }
        }
    }
}

#Preview {
    ContentView()
}

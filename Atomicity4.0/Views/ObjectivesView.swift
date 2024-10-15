//
//  ObjectivesView.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/14/24.
//

import SwiftUI
import SwiftData

struct ObjectivesView: View {
    var size: CGSize
    @Binding var currentDate: Date
    /// SwiftData Dynamic Query
    @Query private var objectives: [Objective]
    init(size: CGSize, currentDate: Binding<Date>) {
        self._currentDate = currentDate
        self.size = size
        /// Predicate
        let calendar = Calendar.current
        let startOfDate = calendar.startOfDay(for: currentDate.wrappedValue)
        let endOfDate = calendar.date(byAdding: .day, value: 1, to: startOfDate)!
        let predicate = #Predicate<Objective> {
            return $0.creationDate >= startOfDate && $0.creationDate < endOfDate
        }
        /// Sorting
        let sortDescriptor = [
            SortDescriptor(\Objective.creationDate, order: .forward)
        ]
        self._objectives = Query(filter: predicate, sort: sortDescriptor, animation: .snappy)
    }
    var body: some View {
//        HeaderView(currentDate: $currentDate)
        VStack(alignment: .leading, spacing: 35) {
            ForEach(objectives) { objective in
                ObjectiveRowView(objective: objective)
                    .background(alignment: .leading) {
                        if objectives.last?.id != objective.id {
                                Rectangle()
                                .frame(width: 1)
                                .offset(x: 8)
                                .padding(.bottom, -35)
                        }
                    }
            }
        }
        .padding([.vertical, .leading], 15)
        .padding(.top, 15)
        .overlay {
            if objectives.isEmpty {
                Text("No objectives Found")
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .frame(width: 150)
                    .offset(y: (size.height - 50) / 2)
            }
        }
    }
}


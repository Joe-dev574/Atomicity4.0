//
//  ContentView.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Objective]
    @State private var createNewObjective: Bool = false
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Objective at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .sheet(isPresented: $createNewObjective) {
                AddObjectiveScreen()
                    .presentationDetents([.large])
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        HapticManager.notification(type: .success)
                    }label: {
                        ZStack{
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth:2.0 , lineCap: .round))
                                .foregroundStyle(.primary)
                                .frame(width: 40, height: 40)
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .frame(width: 35, height: 35)
                                .background(Color.gray.opacity(0.7))
                                .clipShape(Circle())
                        }
                    }
                }
                ToolbarItem(placement: .principal) {
                    HeaderView().padding(.horizontal)
                }
#endif
                ToolbarItem {
                    Button {
                        createNewObjective = true
                        HapticManager.notification(type: .success)
                    } label: {
                        ZStack{
                            Circle()
                                .stroke(style: StrokeStyle(lineWidth:2.0 , lineCap: .round))
                                .foregroundStyle(.primary)
                                .frame(width: 40, height: 40)
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                                .fontWeight(.bold)
                                .frame(width: 35, height: 35)
                                .background(Color.gray.opacity(0.7))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Objective(objectiveTitle: "", remarks: "", isCompleted: false, tint: "taskColor1", timestamp: Date.now)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Objective.self, inMemory: true)
}

//
//  ObjectivesRowView.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/14/24.
//

import SwiftUI
import SwiftData

struct ObjectiveRowView: View {
    @Bindable var objective: Objective
    /// Model Context
    @Environment(\.modelContext) private var context
    /// Direct TextField Binding Making SwiftData to Crash, Hope it will be rectified in the Further Releases!
    /// Workaround use separate @State Variable
    @State private var objectiveTitle: String = ""
    @State private var remarks: String = ""
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Circle()
                .fill(.background)
                .frame(width: 10, height: 10)
                .padding(4)
                .background(.clear.shadow(.drop(color: .black, radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .contentShape(.circle)
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                objective.isCompleted.toggle()
                            }
                        }
                }
            
            VStack(alignment: .leading, spacing: 8, content: {
                TextField("Title", text: $objectiveTitle)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                TextField("Brief Description", text: $remarks)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                    .onSubmit {
                        /// If TaskTitle is Empty, Then Deleting the Task!
                        /// You can remove this feature, if you don't want to delete the Task even after the TextField is Empty
                        if objectiveTitle == "" {
                            context.delete(objective)
                            try? context.save()
                        }
                    }
                    .onChange(of: objectiveTitle, initial: false) { oldValue, newValue in
                        objective.objectiveTitle = newValue
                    }
                    .onAppear {
                        if objectiveTitle.isEmpty {
                            objectiveTitle = objective.objectiveTitle
                        }
                        if remarks.isEmpty {
                            remarks = objective.remarks
                        }
                    }
                
                Label(objective.creationDate.format("hh:mm a"), systemImage: "clock")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
            })
            .padding(15)
            .hSpacing(.leading)
            .background(objective.tintColor, in: .rect(topLeadingRadius: 15, bottomLeadingRadius: 15))
            .strikethrough(objective.isCompleted, pattern: .solid, color: .black)
            .contentShape(.contextMenuPreview, .rect(cornerRadius: 15))
            .contextMenu {
                Button("Delete Objective", role: .destructive) {
                    /// Deleting Task
                    /// For Context Menu Animation to Finish
                    /// If this causes any Bug, Remove it!
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        context.delete( objective)
                        try? context.save()
                    }
                }
            }
            .offset(y: -8)
        }
    }
    
    var indicatorColor: Color {
        if objective.isCompleted {
            return .green
        }
        
        return objective.creationDate.isSameHour ? .darkBlue : (objective.creationDate.isPast ? .red : .black)
    }
}

#Preview {
    ObjectiveRowView(objective: .init(objectiveTitle: "Title", remarks: "Description", isCompleted: false, tint: "", creationDate: Date.now))
}

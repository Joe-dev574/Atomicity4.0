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
                .fill(indicatorColor)
                .frame(width: 35, height: 20)
                .padding(4)
                .background(.white.shadow(.drop(color: .black.opacity(0.7), radius: 3)), in: .circle)
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                        .contentShape(.circle)
                      
                        .frame(width: 35, height: 35)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                objective.isCompleted.toggle()
                            }
                        }
                }
                    VStack(alignment: .leading, spacing: 5, content: {
                        ObjectiveCardView(objective: objective)
                    })
                        }
                        
                        .padding(.horizontal, 10)
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
                    
                    .padding(15)
                    .hSpacing(.leading)
                    .background(.thickMaterial, in: .rect(topLeadingRadius: 10, bottomLeadingRadius: 10))
                    .strikethrough(objective.isCompleted, pattern: .solid, color: .red)
                    .contentShape(.contextMenuPreview, .rect(cornerRadius: 10))
                    .contextMenu {
                        Button("Delete Objective", role: .destructive) {
                            /// Deleting Task
                            /// For Context Menu Animation to Finish
                            /// If this causes any Bug, Remove it!
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                context.delete( objective)
                                try? context.save()
                            }
                        }
                    }
                    .offset(y: -8)
                }
        
    
        var indicatorColor: Color {
            if objective.isCompleted {
                return .green
            }
            
            return objective.creationDate.isSameHour ? .blue : (objective.creationDate.isPast ? .red : .black)
        }
    }

#Preview {
    ObjectiveRowView(objective: .init(objectiveTitle: "WRMG Weld Excellence ", remarks: "Description this is the running of the water and all things that metter", isCompleted: false, tint: "", creationDate: Date.now))
}

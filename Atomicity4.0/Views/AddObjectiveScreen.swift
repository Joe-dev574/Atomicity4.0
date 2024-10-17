//
//  AddObjectiveScreen.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/13/24.
//

import SwiftUI

struct AddObjectiveScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var objectiveTitle = ""
    @State private var remarks = ""
    @State private var objectiveColor: String = "TaskColor1"
    @State private var targetDate: Date = .init()
    let columns = Array(repeating: GridItem(.fixed(50)), count: 6)
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 7){
                Text("Create New Objective")
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                    .font(.title3)
                    .padding(.leading, 15)
                    .padding(.bottom, 10)
                Text("Objective Title")
                    .font(.caption)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
                    .hSpacing(.leading)
                TextField("Objective Title", text:$objectiveTitle)
                    .padding()
                    .font(.headline)
                    .fontDesign(.serif)
                    .foregroundStyle(.black)
                    .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.25), radius: 8)), in: .rect(cornerRadius: 10))
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                Text("Brief Description")
                    .font(.caption)
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                    .foregroundStyle(.blue)
                    .hSpacing(.leading)
                TextEditor(text: $remarks)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .font(.headline)
                    .fontDesign(.serif)
                    .foregroundStyle(.black)
                    .background(.thinMaterial.shadow(.drop(color: .black.opacity(0.25), radius: 8)), in: .rect(cornerRadius: 10))
                    .frame(width: 350, height: 75)
                    .padding(.bottom, 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Establish Target Date")
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                            .font(.caption)
                            .foregroundStyle(.blue)
                            .padding(.top, 10)
                        DatePicker("Target Complete Date", selection: $targetDate)
                            .fontDesign(.serif)
                            .font(.callout)
                            .fontWeight(.bold)
                            .datePickerStyle(.compact)
                            .foregroundStyle(.gray)
                            .scaleEffect(0.9, anchor: .leading)
                    })
                }
                .padding(.trailing, -15)
                /// Giving Some Space for tapping
            }.padding(.horizontal)
            //MARK:  CUSTOM COLOR PICKER (OBJECTIVE COLOR)
            VStack(alignment: .center) {
                Text("Objective Color")
                    .fontDesign(.serif)
                    .fontWeight(.bold)
                    .font(.caption)
                    .foregroundStyle(.blue)
                CustomColorPicker()
        //            .background(.background.shadow(.drop(color: .black.opacity(0.25), radius: 8)), in: .rect(cornerRadius: 10))
                    .padding()
                Spacer( )
            }.padding(.top, 15)
            .toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    Button {
                        HapticManager.notification(type: .success)
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                })
                ToolbarItem(placement: .principal, content: {
                    LogoView()
                })
                ToolbarItem(placement:.topBarTrailing, content: {
                    Button {
                       
                        /// Saving Task
                        let objective = Objective(objectiveTitle: objectiveTitle, remarks: remarks, isCompleted: false, tint: objectiveColor, creationDate: targetDate)
                        do {
                            context.insert(objective)
                            try context.save()
                            /// After Successful Task Creation, Dismissing the View
                            dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                        HapticManager.notification(type: .success)
                        dismiss()
                    } label: {
                        Text("Save")
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(objectiveTitle.isEmpty || remarks.isEmpty)
                    .padding(.horizontal, 2)
                })
            }
                    
                }
            
        }
    }

#Preview {
    AddObjectiveScreen()
        .vSpacing(.bottom)
}

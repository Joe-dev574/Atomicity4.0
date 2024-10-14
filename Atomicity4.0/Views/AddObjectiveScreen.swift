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
    @State private var title = ""
    @State private var remarks = ""
    @State private var objectiveColor: String = "TaskColor1"
    @State private var targetDate: Date = .init()
    let columns = Array(repeating: GridItem(.fixed(50)), count: 6)
    var body: some View {
        NavigationStack {
            HeaderView()
            Divider()
                .padding(.bottom, 10)
            VStack(alignment: .center, spacing: 5){
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
                    .foregroundStyle(.blue)
                    .hSpacing(.leading)
                TextField("Objective Title", text:$title)
                    .padding()
                    .font(.headline)
                    .fontDesign(.serif)
                    .foregroundStyle(.black)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 7)), in: .rect(cornerRadius: 7))
                    .padding(.bottom, 10)
                Text("Brief Description")
                    .font(.caption)
                    .fontDesign(.serif)
                    .foregroundStyle(.blue)
                    .hSpacing(.leading)
                TextEditor(text: $remarks)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .font(.headline)
                    .fontDesign(.serif)
                    .foregroundStyle(.black)
                    .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 10)), in: .rect(cornerRadius: 10))
                    .frame(width: 350, height: 100)
                    .padding(.bottom, 10)
                HStack {
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Establish Target Date")
                            .fontDesign(.serif)
                            .font(.caption)
                            .foregroundStyle(.blue)
                            .padding(.top, 10)
                        DatePicker("Target Complete Date", selection: $targetDate)
                            .fontDesign(.serif)
                            .font(.callout)
                            .datePickerStyle(.compact)
                            .foregroundStyle(.gray)
                            .scaleEffect(0.9, anchor: .leading)
                    })
                }
                .padding(.trailing, -15)
                /// Giving Some Space for tapping
                
                VStack(alignment: .center, spacing: 10){
                    Text("Objective Color")
                        .fontDesign(.serif)
                        .font(.caption)
                        .foregroundStyle(.blue)
                        .padding(.top, 10)
                    
                    let colors: [String] = (1...22).compactMap { index -> String in
                        return "TaskColor\(index)"
                    }
                    VStack(alignment: .center) {
                        ScrollView(.horizontal) {
                            LazyVGrid(columns:columns){
                                ForEach(colors, id: \.self) { color in
                                    
                                    Circle()
                                        .fill(Color(color).gradient)
                                        .frame(width: 40, height: 24)
                                        .background(content: {
                                            Circle()
                                                .fill(Color(color))
                                                .frame(width: 20, height: 20)
                                                .background(content: {
                                                    Circle()
                                                        .stroke(lineWidth: 2)
                                                        .opacity(objectiveColor == color ? 1 : 0)
                                                })
                                                .hSpacing(.center)
                                                .contentShape(.rect)
                                                .onTapGesture {
                                                    withAnimation(.snappy) {
                                                        objectiveColor = color
                                                    }
                                                }
                                        })
                                    
                                }
                            }
                        }
                        .padding(.top, 5)
                        
                        HStack {
                            Spacer()
                            VStack(alignment: .center) {
                                Button{
                                    // Save Objective
                                    HapticManager.notification(type: .success)
                                    dismiss()
                                } label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 7)
                                            .fill(Color.blue)
                                            .frame(width: 300, height: 45)
                                        Text("Save")
                                            .font(.title2)
                                            .foregroundStyle(.white)
                                            .fontWeight(.bold)
                                            .fontDesign(.serif)
                                            .padding()
                                    }
                                }
                                .disabled(title.isEmpty || remarks.isEmpty)
                                .padding(.horizontal)
                            }
                            Spacer()//to center save button
                        }
                        .padding(.top, 30)
                    }.padding(.horizontal,4)
                    Spacer( )
                }
                .hSpacing(.center)
                
            }
        }
    }
}
#Preview {
    AddObjectiveScreen()
}

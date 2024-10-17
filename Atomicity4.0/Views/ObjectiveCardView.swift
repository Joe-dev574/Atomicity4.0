//
//  ObjectiveCardView.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/15/24.
//

import SwiftUI
import SwiftData

struct ObjectiveCardView: View {
 let objective: Objective
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                
                HStack {
                    VStack(alignment: .leading) {
                       
                        HStack{
                            ZStack {
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(Color.blue)
                                    .frame(height: 30)
                                HStack {
                                    Text("test")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .fontDesign(.serif)
                                        .foregroundStyle(.ultraThickMaterial)
                                        .padding(.horizontal, 7)
                                    Spacer( )
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        Text(objective.objectiveTitle)
                            .font(.title3)
                            .fontDesign(.serif)
                            .foregroundColor(.indigo)
                            .padding(.horizontal, 7)
                            .padding(.top, 1)
                        Text(objective.remarks)
                            .font(.caption)
                            .fontDesign(.serif)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 7)
                            .padding(.bottom, 40)
                            .lineLimit(1)
                        HStack {
                            Text("Added:")
                                .fontDesign(.serif)
                                .font(.caption)
                                .foregroundStyle(.gray)
                            Image(systemName: "calendar")
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .padding(.trailing, -20)
                             
                            Text(DateFormatter.localizedString(from: objective.creationDate, dateStyle: .medium, timeStyle: .none))
                                .fontDesign(.serif)
                                .font(.caption)
                                .foregroundStyle(.gray)
                                .padding(.horizontal, 7)
                                .padding(.trailing, 10)
                            ZStack{
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(Color.primary)
                                    .frame(width: 57, height: 27)
                                RoundedRectangle(cornerRadius: 7)
                                    .fill(Color.red)
                                    .frame(width: 55, height: 25)
                                Text("Ozark")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .fontDesign(.serif)
                                    .foregroundStyle(.white)
                                
                                    
                            }
                        }.padding(.top, -10)
                    }.padding(.horizontal, 10)
                    Spacer( )
                }
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.35))
                    .frame(width: 310, height: 150)
                
                
            }
        }.padding(.horizontal, 1)
            .padding(.top, -10)
    }
}


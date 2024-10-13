//
//  HeaderView.swift
//  Atomicity4.0
//
//  Created by Joseph DeWeese on 10/13/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Spacer()
                ZStack{
                  
                    Image(systemName: "atom")
                        .resizable()
                        .frame(width: 50, height: 45)
                        .foregroundColor(.blue).opacity(0.3)
                    HStack {
                        Text("Atom")
                            .font(.title2)
                            .fontDesign(.serif)
                            .fontWeight(.bold)
                            .padding(.leading, 10)
                            .foregroundColor(.blue)
                            .offset(x: 8, y: -1)
                    Text("icity")
                        .font(.title3)
                        .fontDesign(.serif)
                        .fontWeight(.heavy)
                        .foregroundStyle(.primary)
                        Text("4")
                            .font(.caption)
                            .fontDesign(.serif)
                            .fontWeight(.regular)
                            .padding(.leading, 10)
                            .foregroundColor(.blue)
                            .offset(x: -16, y: -6)
                    }.offset(x: 1)
                }
                Spacer()
                
            }
        }.padding(.horizontal)
    }
}

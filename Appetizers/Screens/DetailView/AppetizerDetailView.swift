//
//  DetailView.swift
//  Appetizers
//
//  Created by murad on 18.09.2025.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
            
            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            
            HStack(spacing: 40) {
                VStack(spacing: 5) {
                    Text("Calories")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.calories)")
                        .italic()
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                
                VStack(spacing: 5) {
                    Text("Carbs")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.carbs)")
                        .italic()
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
                
                VStack(spacing: 5) {
                    Text("Proteins")
                        .bold()
                        .font(.caption)
                    Text("\(appetizer.protein)")
                        .italic()
                        .fontWeight(.semibold)
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.bottom)
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundStyle(.white)
                    .background(.brandPrimary)
                    .cornerRadius(10)
            }
            .padding(.bottom, 30)
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false 
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundStyle(.black)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

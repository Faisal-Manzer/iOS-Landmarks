//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Faisal Manzer on 14/12/20.
//

import SwiftUI

struct CategoryHome: View {
    @State private var showingProfile = false
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                ZStack {
                    modelData.features[0].image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                    
                    NavigationLink(destination: LandmarkDetail(landmark: modelData.features[0])) {
                        EmptyView()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar {
                Button(action: { showingProfile.toggle() }) {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}

//
//  HomeView.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 05/08/2024.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewmodel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            ZStack {
                ZStack {
                    LinearGradient(colors: [Color("#111111"),Color("#313131")], startPoint: .topTrailing, endPoint: .bottomLeading)
                        .ignoresSafeArea()
                }
                
                HStack {
                    VStack(alignment: .leading,spacing: 8) {
                        Text("Location")
                            .foregroundStyle(Color("#A2A2A2"))
                            .setFont(fontName: .mainFont, size: 12)
                        
                        Text("Bilzen, Tanjungbalai")
                            .foregroundStyle(.white)
                            .setFont(fontName: .mainFontMeduim, size: 16)
                        
                        Spacer()
                    }
                    .padding(.top,10)
                    
                    Spacer()
                }
                .padding(.horizontal,24)
                
                HStack(spacing: 10) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        ZStack(alignment: .leading) {
                            if viewmodel.txt.isEmpty {
                               Text("Search coffee")
                                   .foregroundColor(.gray) // Custom placeholder color
                           }

                            TextField("", text: $viewmodel.txt)
                               .foregroundColor(.white)
                               .onTapGesture {
                                   viewmodel.isEditing = true
                               }
                       }
                       .padding(.vertical, 8)
                        
                    }
                    .frame(height: 54)
                    .padding(.horizontal)
                    .background(Color(.systemGray5).opacity(0.2))
                    .cornerRadius(8)

                    Button(action: {
                        // Action for filter button
                        
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.brown)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .offset(y: -20)
            }
            .frame(height: 280)
            
            Image("Banner")
                .offset(y: -80)
                .padding(.bottom,-56)
            
            
            ScrollView {
                
                // First catogry
                ScrollView(.horizontal,showsIndicators: false) {
                    
                    HStack(spacing: 24) {
                        ForEach(viewmodel.data,id: \.id) { element in
                            SectionCell(model: element)
                        }
                    }
                    
                    
                }
                .frame(height: 29)
                .padding(.horizontal,20)
                .padding(.top,12)
                .padding(.bottom,12)
                
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: UIScreen.screenWidth / 3))], spacing: 16) {
                        ForEach(Array(viewmodel.coffes.enumerated()), id: \.offset) { index, coffe in
                            
                            ProductCell(model: coffe)
                        }
                    }
                }
                .padding(.horizontal,20)
                
            }
            .background(Color("#C8C8C8"))
            
            
           
            
            Spacer()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

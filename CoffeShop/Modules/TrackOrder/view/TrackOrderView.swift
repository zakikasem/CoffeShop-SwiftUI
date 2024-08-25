//
//  TrackOrderView.swift
//  CoffeShop
//
//  Created by Mohamed Ali on 25/08/2024.
//

import SwiftUI
import MapKit

struct TrackOrderView: View {
    
    @StateObject var viewmodel = TrackOrderViewModel()
    
    var body: some View {
        
        ZStack {
            
            Map(coordinateRegion: $viewmodel.region,showsUserLocation: true)
            
            VStack {
                
                HStack {
                    
                    Button {
                        // MARK: - Back button.
                        
                    } label: {
                        Image("Back")
                    }
                    .frame(width: 50,height: 50)
                    
                    Spacer()
                    
                    Button {
                        // MARK: - User Location button.
                        viewmodel.fetchUserLocation()
                    } label: {
                        Image("GPS")
                    }
                    .frame(width: 50,height: 50)

                    
                }
                .padding(.horizontal,24)
                .padding(.top,64)
                
                Spacer()
                
                VStack {
                    Image("Indicator")
                        .padding(.bottom,12)
                        .padding(.top,18)
                    
                    Text("10 minutes left")
                        .setFont(fontName: .mainFontBold, size: 16)
                        .padding(.bottom,4)
                    
                    HStack(spacing: 4) {
                        Text("Delivery to")
                            .setFont(fontName: .mainFont, size: 14)
                            .foregroundStyle(Color("#A2A2A2"))
                        
                        Text("Jl. Kpg Sutoyo")
                            .setFont(fontName: .mainFontSemiBold, size: 14)
                    }
                    .padding(.bottom,22)
                    
                    
                    HStack(spacing: 10) {
                        ForEach(0..<4) { i in
                            Rectangle()
                               .fill(i != 3 ? Color.green : Color("#E3E3E3"))
                               .frame(height: 4)
                               .cornerRadius(2)
                        }
                    }
                    .padding(.horizontal,30)
                    .padding(.bottom,16)
                    
                    
                    VStack {
                        ZStack {
                            
                            HStack {
                                ZStack {
                                    Image("Mask Group")
                                }
                                .frame(width: 56,height: 56)
                                .borderedCornerRadius(13, corners: .allCorners, lineWidth: 1, borderColor: Color("#E3E3E3"))
                                
                                VStack(alignment: .leading,spacing: 4) {
                                    Text("Delivered your order")
                                        .setFont(fontName: .mainFontBold, size: 14)
                                    
                                    Text("We will deliver your goods to you in the shortes possible time.")
                                        .setFont(fontName: .mainFont, size: 12)
                                        .foregroundStyle(Color("#A2A2A2"))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                
                                Spacer()
                            }
                            
                        }
                        .padding()
                        .frame(height: 77)
                        .borderedCornerRadius(12, corners: .allCorners, lineWidth: 1, borderColor: Color("#E3E3E3"))
                    }
                    .padding(.horizontal,30)
                    .padding(.bottom,16)
                    
                    
                    HStack {
                        
                        Image("Profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 56)
                            .padding(.trailing,10)
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Brooklyn Simmons")
                                .setFont(fontName: .mainFontSemiBold, size: 14)
                            
                            Text("Personal Courier")
                                .setFont(fontName: .mainFont, size: 12)
                                .foregroundStyle(Color("#A2A2A2"))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // MARK: - Call Button action.
                        }, label: {
                            
                            ZStack {
                                Image("call")
                            }
                            .frame(width: 44,height: 44)
                            .borderedCornerRadius(13, corners: .allCorners, lineWidth: 1, borderColor: Color("#E3E3E3"))
                            
                            
                        })
                        
                    }
                    .padding(.horizontal,30)
                    .padding(.bottom,38)
                    
                    
                    
                    
                }
                .background(Color.white)
                .cornerRadius(24, corners: [.topLeft,.topRight])
            }
           
            
            
        }
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    TrackOrderView()
}

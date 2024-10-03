//
//  WelcomeView.swift
//  GOATFood
//
//  Created by Hồ Đắc Minh Hoàng on 26/9/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("taphoanho")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 8)
                
                Text("Chào mừng bạn đến với \n tạp hoá nhỏ!")
                    .font(.customfont(.semibold, fontSize: 21))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                
                
                Text("Mua hàng nhanh, giao hàng lẹ")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundStyle(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 30)
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "Bắt đầu") {
                        
                    }
                }
                               
                Spacer()
                    .frame(height: 70)
                
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}

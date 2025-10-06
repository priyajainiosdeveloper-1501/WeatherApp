//
//  SplashView.swift
//  WeatherApp
//
//  Created by Saurabh Sawla on 06/10/25.
//
import SwiftUI
import Foundation
struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            LoginView() // Next page
        } else {
            VStack {
                Image("app_logo")
                Text("Weather App")
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}

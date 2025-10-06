//
//  Login.swift
//  WeatherApp
//
//  Created by Saurabh Sawla on 06/10/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer() // Push content to center vertically

                VStack(spacing: 20) {
                    Text("Weather App Login")
                        .font(.largeTitle)
                        .bold()

                    TextField("Email", text: $vm.email)
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)

                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    if let error = vm.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                    }

                    if vm.isLoading {
                        ProgressView()
                    } else {
                        Button("Login") {
                            Task {
                                await vm.login()
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                }
                .padding()
                .frame(maxWidth: 400) // Optional: max width for larger screens

                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $vm.loginSuccess) {
                WeatherView() // Navigate to Weather page after success
            }
        }
    }
}


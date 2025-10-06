import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var loginSuccess = false
    @Published var errorMessage: String?

    @MainActor
    func login() async {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please fill all fields"
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            // Simulate API call
            try await Task.sleep(nanoseconds: 1_000_000_000) // 1 second delay

            if email.lowercased() == "test@example.com" && password == "123456" {
                loginSuccess = true
            } else {
                errorMessage = "Invalid credentials"
            }
        } catch {
            errorMessage = "Something went wrong"
        }

        isLoading = false
    }
}



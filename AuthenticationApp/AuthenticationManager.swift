//
//  AuthenticatorManager.swift
//  AuthenticationApp
//
//  Created by Vanderson Arruda on 07/08/23.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    private(set) var context = LAContext()
    @Published private(set) var biometryType: LABiometryType = .none
    private(set) var canEvaluatePolicy = false
    
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    init() {
        getBiometryType()
    }
    
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext()
        // Sempre que o usuário for fazer a autenticação,
        // precisa chamar novamente o método LAContext
        
        if canEvaluatePolicy {
            let reason = "Logn into your account"
            
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("isAuthenticated", self.isAuthenticated)
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true // para exibir que deu erro
                    self.biometryType = .none // trocar o tipo na View
                }
            }
        }
    }
    
    func authenticateWithCredentials(username: String, password: String) {
        if username.lowercased() == "vanderson" && password == "12345" {
            isAuthenticated = true
        } else {
            errorDescription = "Wrong credentials"
            showAlert = true
        }
    }
    
    func logout() {
        isAuthenticated = false
    }
}

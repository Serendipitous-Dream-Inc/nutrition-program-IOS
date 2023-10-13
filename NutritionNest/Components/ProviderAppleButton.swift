//
//  ProviderAppleButton.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/10/23.
//

import SwiftUI
import UIKit
import AuthenticationServices

struct ProviderAppleButton: View {
    
    let onRequest: (ASAuthorizationAppleIDRequest) -> Void
    let onCompletion: ((Result<ASAuthorization, Error>) -> Void)
    @State private var request: ASAuthorizationAppleIDRequest?
    
    var body: some View {
        ProviderButton(image: .assets.logos.appleLogo) {
            createRequest()
        }
        .background {
            AuthorizationController(request: $request, onCompletion: onCompletion)
        }
    }
    
    func createRequest() {
        let nonce = CryptoHelper.randomNonceString()
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.nonce = CryptoHelper.sha256(nonce)
        onRequest(request)
        self.request = request
    }
}

#Preview {
    ProviderAppleButton { request in
        request.requestedScopes = [.fullName, .email]
    } onCompletion: { _ in
        
    }
}

private struct AuthorizationController: UIViewControllerRepresentable {
    
    @Binding var request: ASAuthorizationAppleIDRequest?
    let onCompletion: ((Result<ASAuthorization, Error>) -> Void)
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        context.coordinator.viewController = viewController
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let request {
            context.coordinator.initiateRequest(with: request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
        let parent: AuthorizationController
        var viewController: UIViewController?
        
        init(parent: AuthorizationController) {
            self.parent = parent
        }
        
        func initiateRequest(with request: ASAuthorizationAppleIDRequest) {
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
            DispatchQueue.main.async {
                self.parent.request = nil
            }
        }
        
        func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return viewController!.view.window!
        }
        
        func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
            parent.onCompletion(.failure(error))
        }
        
        func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
            parent.onCompletion(.success(authorization))
        }
    }
}

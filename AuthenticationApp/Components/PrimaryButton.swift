//
//  PrimaryButton.swift
//  AuthenticationApp
//
//  Created by Vanderson Arruda on 07/08/23.
//

import SwiftUI

struct PrimaryButton: View {
    var image: String? // é um opcional pq podemos não querer usar imagem no botão
    var showImage = true
    var text: String
    
    
    var body: some View {
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
            }
            
            Text(text)
        }
        .padding()
        .padding(.horizontal)
        .background(.white)
        .cornerRadius(30)
        .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(image: "faceid", text: "Login with FaceID")
    }
}

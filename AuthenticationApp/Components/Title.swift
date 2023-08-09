//
//  Title.swift
//  AuthenticationApp
//
//  Created by Vanderson Arruda on 07/08/23.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .font(.title)
            .bold()
            .foregroundColor(.white)
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

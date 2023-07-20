//
//  Validating&DisablingForms.swift
//  CupcakeCorner
//
//  Created by Brandon Johns on 7/18/23.
//

import SwiftUI

struct Validating_DisablingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create Account") {
                    print("Creating account..")
                }
            }
            .disabled(disableForm)
        }
        
        var disableForm: Bool {
            username.count < 5 || email.count < 5
        }
    }
}

struct Validating_DisablingForms_Previews: PreviewProvider {
    static var previews: some View {
        Validating_DisablingForms()
    }
}

//
//  LoadingImageFromServer.swift
//  CupcakeCorner
//
//  Created by Brandon Johns on 7/18/23.
//

import SwiftUI

struct LoadingImageFromServer: View {
    var body: some View {
        VStack {
          
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                
                } else if  phase.error  != nil {
                    Text("Error loading image ")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}

struct LoadingImageFromServer_Previews: PreviewProvider {
    static var previews: some View {
        LoadingImageFromServer()
    }
}

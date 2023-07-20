//
//  SendingRecievingCodableDataURLSession.swift
//  CupcakeCorner
//
//  Created by Brandon Johns on 7/18/23.
//


// all this just downloads data


//async might go to sleep
//await acknowledge it might sleep

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct SendingRecievingCodableDataURLSession: View {
    
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        do {
            // data = new constant
            //_ = meta data toss it away
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
                
            
        } catch {
            print("Invalid data")
        }
        
        
    }
    
    
}

struct SendingRecievingCodableDataURLSession_Previews: PreviewProvider {
    static var previews: some View {
        SendingRecievingCodableDataURLSession()
    }
}

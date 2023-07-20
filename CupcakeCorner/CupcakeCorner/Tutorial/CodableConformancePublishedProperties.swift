//
//  CodableConformancePublishedProperties.swift
//  CupcakeCorner
//
//  Created by Brandon Johns on 7/18/23.
//

//required anyone who subclasses User must overrride init with custom data
//          required is required in subclasses

// final class  User: removes the ability to create subclasses so required is not longer needed

// container holds the keys of the CodingKeys enum
import SwiftUI

class User: ObservableObject, Codable {
    
    //save coding property
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Brandon Johns"
    
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct CodableConformancePublishedProperties: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CodableConformancePublishedProperties_Previews: PreviewProvider {
    static var previews: some View {
        CodableConformancePublishedProperties()
    }
}

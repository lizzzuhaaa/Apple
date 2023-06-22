//
//  CreateCats.swift
//  Networking
//
//  Created by лізушка лізушкіна on 29.05.2023.
//

import Foundation


public struct Cats:Identifiable
{
    public var id = UUID()
    var URL: String
    var name: String
}

public func createCats ()
{
    var cats : [Cats] = []
    let n = NetworkManager()
    var i = 0
    while i<100
    {
        n.fetchCatImageURLs { imageURLString in
            if let imageURLString = imageURLString {
                var cat = Cats(URL: imageURLString, name: n.createName())
                cats.append(cat)
            } else {
                print("Failed to fetch image URL.")
            }
        }
        i+=1
    }
    print(cats)
    //return cats
}


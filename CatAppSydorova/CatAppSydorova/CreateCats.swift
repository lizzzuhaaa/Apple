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
    public var URL: String
    public var name: String
    public var zero:Int = 0
    public var array:[Int] = [1,1,1]
}

public func createCats() -> [Cats] {
    let dispatchGroup = DispatchGroup()
    let n = NetworkManager()
    var cats: [Cats] = []

    for _ in 0..<25 {
        dispatchGroup.enter()
        n.fetchCatImageURLs { imageURLString in
            if let imageURLString = imageURLString {
                let cat = Cats(URL: imageURLString, name: n.createName())
                cats.append(cat)
            } else {
                print("Failed to fetch image URL.")
            }
            dispatchGroup.leave()
        }
    }

    dispatchGroup.wait() // Wait for all the network requests to finish before returning

    return cats
}

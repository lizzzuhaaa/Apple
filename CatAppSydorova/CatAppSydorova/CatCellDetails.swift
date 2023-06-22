//
//  CatCellDetails.swift
//  Networking
//
//  Created by лізушка лізушкіна on 29.05.2023.
//

import Foundation
import Networking
import SwiftUI

struct CatCellView: View {
    var exactCat: Cats
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: exactCat.URL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        Text(exactCat.name)
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(8)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(10)
                            .padding(.leading),
                        alignment: .center
                    )
            }placeholder: {
            ProgressView()
        }
        }
    }
}

struct CatDetailsView: View
{
    let exactCat:Cats
    @State private var catImage: UIImage? = nil
    var body: some View
    {
        VStack {
            Group
            {
                AsyncImage(url: URL(string: exactCat.URL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                }
                
                Text(exactCat.name)
                    .font(.title)
                    .padding(8)
                
            }
            .padding(8)
            
        }
    }
}



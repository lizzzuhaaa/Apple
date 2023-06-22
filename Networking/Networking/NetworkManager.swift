//
//  NetworkManager.swift
//  Networking
//
//  Created by лізушка лізушкіна on 26.05.2023.
//

import Foundation

public class NetworkManager{
    
    public init(){}
    
    public func fetchCatImageURLs(completion: @escaping (String?) -> Void) {
        if let animal = Bundle.main.infoDictionary?["Input"] as? String
        {
            var urlString:String = ""
            if animal == "CATS"
            {
                urlString = "https://api.thecatapi.com/v1/images/search"
            }
            else if animal == "DOGS"
            {
                urlString = "https://api.thedogapi.com/v1/images/search"
            }
            
            if let url = URL(string: urlString) {
                let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                    if error != nil {
                        print("JSON Parsing Error")
                        completion(nil)
                        return
                    }
                    
                    if let data = data {
                        do {
                            if let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                                if let firstImage = jsonArray.first, let imageURLString = firstImage["url"] as? String {
                                    completion(imageURLString)
                                    return
                                }
                            }
                        } catch {
                            print("JSON Parsing Error")
                        }
                    }
                    
                    completion(nil)
                }
                
                task.resume()
            }
        }
    }




    public func createName() -> String
    {
        let catNames:[String] = [
            "Ammy",
            "Amber",
            "Backer",
            "Bunny",
            "Betty",
            "Charlie",
            "Coco",
            "Coraline",
            "Catherin",
            "Dina",
            "Docker",
            "Doll",
            "Ducky",
            "Daddy",
            "Emma",
            "Ember",
            "Elison",
            "Echy",
            "Etan",
            "Frog",
            "Funny",
            "Felix",
            "Felisia",
            "Google",
            "Garfield",
            "Maison",
            "Yanix",
            "Party",
            "Missa",
            "Hero",
            "Itachi",
            "Brain",
            "Business",
            "Boss",
            "Lisa",
            "April",
            "Makima",
            "Denji",
            "Power",
            "Nana",
            "Hachi",
            "Amber"
        ]
        
        return catNames.randomElement()!
    }
}


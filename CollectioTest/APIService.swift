//
//  APIService.swift
//  CollectioTest
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation
import UIKit

enum Result <T>{
    case Success(T)
    case Error(String)
}

class APIService: NSObject {
    
    static let shared = APIService()
    
   let session = URLSession.shared
    
    lazy var endPoint: String = {
        return "https://api.imgur.com/3/gallery/r/cats"
        
    }()
    
    func getDataWith(completion: @escaping (Result<[[String: AnyObject]]>) -> Void) {
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.addValue("Client-ID feb9030c81092ac", forHTTPHeaderField: "Authorization")
        
        session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {return}
            guard let data = data else {return}
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    
                   // print("JSON = \(json)")
                    
                    guard let itemsJsonArray = json["data"] as? [[String: AnyObject]] else {
                        return
                    }

                    DispatchQueue.main.async {
                        completion(.Success(itemsJsonArray))
                    }
                    
                }
            }catch let error {
                return completion(.Error(error.localizedDescription))
            }
            }.resume()
        
    }
    
    func downloadMage(FromLink url: String, _ completion: @escaping (UIImage) -> Void){
        guard  let url = URL(string: url) else {
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {return}
            guard let data = data, let image = UIImage(data: data)
                else {
                    return
//                    return completion(.Error("Error = \(String(describing: error?.localizedDescription))")!)
                   }
            DispatchQueue.main.async {
                completion(image)
            }
            }.resume()
        
        
    }
    
}

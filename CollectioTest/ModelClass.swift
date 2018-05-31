//
//  ModelClass.swift
//  CollectioTest
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation
import UIKit

class ModelClass {
    
    var id:Double
    var link: String
    var title: String
    
    init(id: Double, link: String, title: String) {
        self.id = id
        self.link = link
        self.title = title
    }
    
    func image(completion:@escaping (UIImage) -> Void) {
        
        if let image = cacheClass.image(forkey: String(id) ) {
            completion(image)
        }else{
            APIService.shared.downloadMage(FromLink: link) { (image) in
               cacheClass.add(image, forkey: String(self.id))
                    completion(image)
            
            }
        }
        
       
        
    }
    
}

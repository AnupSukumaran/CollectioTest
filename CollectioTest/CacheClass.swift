//
//  CacheClass.swift
//  CollectioTest
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import Foundation
import UIKit

// to call globally declaing it outside the class
let cacheClass = CacheClass()

class CacheClass: NSCache<AnyObject, AnyObject> {
    
    func add(_ image: UIImage, forkey key: String) {
        setObject(image, forKey: key as AnyObject)
    }
    
    func image(forkey key: String) -> UIImage? {
        guard let image = object(forKey: key as AnyObject) as? UIImage else {
            return nil
        }
        return image
    }
}

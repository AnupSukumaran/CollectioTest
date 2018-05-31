//
//  ImagesCollectionViewCell.swift
//  CollectioTest
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func config(with modelClass: ModelClass) {
        self.titleLabel.text = modelClass.title
        
        modelClass.image { (images) in
            self.imageView.image = images
        }
        
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        imageView.image = nil
    }
    
}

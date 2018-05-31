//
//  ViewController.swift
//  CollectioTest
//
//  Created by Sukumar Anup Sukumaran on 31/05/18.
//  Copyright © 2018 TechTonic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var modelClass = [ModelClass]()
  
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        CallingURL()
    }
    
    func CallingURL() {
        APIService.shared.getDataWith { (response) in
           // print("Response = \(response)")
            switch response {
            case .Success(let data):
                self.jsonResultParse(data as AnyObject)
            case .Error(let message):
                print("Error = \(message)")
            }
        }
    }

    func jsonResultParse(_ json:AnyObject) {
        let JsonArray = json as! NSArray
       // print("jsonaArray = \(JsonArray)")
        if JsonArray.count != 0 {
            
            for i:Int in 0..<JsonArray.count {
                
                let jObject = JsonArray[i] as! NSDictionary
                let id = (jObject["id"] as! NSString).doubleValue
                let title = jObject["title"] as! String
                let link = jObject["link"] as! String
                //callingImageURL(link: link)
                modelClass.append(ModelClass(id: id, link: link, title: title))
                
            }
            collectionView.reloadData()
        }
    }
    
//    func callingImageURL(link:String){
//
//        APIService.shared.downloadMage(FromLink: link) { (response) in
//
//            switch response {
//            case .Success(let Image):
//                 self.jsonResultParse2(Image as AnyObject)
//               // modelImages.append(Image)
//            case .Error (let message):
//            print("Error = \(message)")
//            }
//
//        }
//    }
//
//    func jsonResultParse2(_ Ima:AnyObject) {
//        let images = Ima as! UIImage
//        print("IMAGES= \(images)")
//        modelImages.append(images)
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelClass.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImagesCollectionViewCell
        
        cell.config(with: modelClass[indexPath.item])
//        cell.titleLabel.text = modelClass[indexPath.row].title
//       // cell.imageView.image = modelImages[indexPath.row]
//        modelClass[indexPath.row].image { (images) in
//            cell.imageView.image = images
//        }
        //callingImageURL(link: modelClass[indexPath.row].link)
        
        return cell
    }
    
    
    
}

//
//  ViewController.swift
//  FlipKrt
//
//  Created by Mac Mini on 23/04/20.
//  Copyright © 2020 Mac Mini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dictCompleteData : [ String : [[String:String]] ] = [
        
        "0": [["img_nme":"sle2"]],
        "1":[["img":"phone1","product_name":"oneplus7","price":"Rs :42,000","discount_price":"Rs:35,000"],["img":"jewel1","product_name":"Bangles","price":"Rs:2,000","discount_price":"Rs:1,599"],["img":"phoneThree","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneFour","product_name":"iPhone","price":"$100","discount_price":"$99"]
        ],
        "2":[["img":"phone2","product_name":"Oppo","price":"Rs:32,999","discount_price":"Rs:20,000"],["img":"jewel2","product_name":"Neckalce","price":"Rs:2599","discount_price":"Rs:1599"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"]
        ],
        "3":[["img":"cooker1","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"cooker2","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"]
        ],
        "4":[["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"]
        ],
        "5":[["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"],["img":"phoneOne","product_name":"iPhone","price":"$100","discount_price":"$99"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0{
            var heightInPixels = 0.0
            if let image = UIImage(named: "sle") {
                let ratio = image.size.width / image.size.height
                heightInPixels = Double(view.frame.width / ratio)
            }
            return CGFloat(heightInPixels)
        }
        else{
            return 280
            

            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dictCompleteData.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cellTble = tableView.dequeueReusableCell(withIdentifier: "FirstTbleRwoID", for: indexPath) as! FirstTbleRwo
            
            let arrayOne = dictCompleteData["\(indexPath.row)"]
            let dictOne = arrayOne![indexPath.row]
            let imgNme = dictOne["img_nme"]
            
            cellTble.imgeFirstRow.image = UIImage(named: imgNme!)
                    return cellTble
        }
        else {
            
            let cellCollection = tableView.dequeueReusableCell(withIdentifier: "SecondTableRowID", for: indexPath) as! SecondTableRow
            
            let itemSie = 230
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
            layout.itemSize = CGSize(width: itemSie , height: 250)
            layout.minimumInteritemSpacing = 20
            layout.minimumLineSpacing = 10
            layout.scrollDirection = .horizontal
            cellCollection.collectionViewItems.collectionViewLayout = layout
            
            cellCollection.collectionViewItems.tag = indexPath.row
            
            return cellCollection
        }
    }
}

extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let someObject = dictCompleteData["\(collectionView.tag)"]
        return someObject!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let arrayCollectionViewObjects = dictCompleteData["\(collectionView.tag)"]
        
        let dictCollectionProductDetils = arrayCollectionViewObjects![indexPath.row]
        
        let imgeNme = dictCollectionProductDetils["img"]
        let price = dictCollectionProductDetils["price"]
        let discountPrice = dictCollectionProductDetils["discount_price"]
        let productNme = dictCollectionProductDetils["product_name"]
        
        let collectionVar = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellID", for: indexPath) as! CollectionViewCell
        collectionVar.lbelOriginlPrice.text = price
        collectionVar.lbelDiscountPrice.text = discountPrice
        collectionVar.productNme.text = productNme
        collectionVar.productImg.image = UIImage(named: imgeNme!)

        
        return collectionVar
    }

}





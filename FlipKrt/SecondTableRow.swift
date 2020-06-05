//
//  SecondTableRow.swift
//  FlipKrt
//
//  Created by Mac Mini on 23/04/20.
//  Copyright © 2020 Mac Mini. All rights reserved.
//

import UIKit

class SecondTableRow : UITableViewCell {

    @IBOutlet var collectionViewItems: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

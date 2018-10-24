//
//  CustomCollectionViewCell.swift
//  examenSegMano
//
//  Created by Peter Caballero on 24/10/18.
//  Copyright © 2018 Peter Caballero. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagen: CustomImageView!
    
    func displayContent(img: UIImage){
        self.imagen.image = img
    }
    

    
}

//
//  GaleriaCollectionViewController.swift
//  examenSegMano
//
//  Created by Peter Caballero on 23/10/18.
//  Copyright © 2018 Peter Caballero. All rights reserved.
//

import UIKit

private let reuseIdentifier = "imageCell"

/// Se crea el collectionViewController con celdas de tipo Custom, para almacenar la imagen
/// Se configura el Delegado y Datasource asociandolos mediante el IBOutlet de esta clase
/// Al girar el dispositivo se emplea la deteccion de la orientacion para reubicar las celdas
class GaleriaCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var numberOfColumns:CGFloat = 1.0
    var numberOfRows:CGFloat = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.configOutlets()
        
    }
    
    
    
    func configOutlets(){
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            layout.scrollDirection = UICollectionViewScrollDirection.horizontal
            numberOfColumns = 1.5
            numberOfRows = 1.0
        } else {
            layout.scrollDirection = UICollectionViewScrollDirection.vertical
            numberOfColumns = 2.0
            numberOfRows = (CGFloat(imageURLs.count) / 2.0)
        }
        
        
    }
    
    
    // #Mark: Orientation
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        if ((toInterfaceOrientation == UIInterfaceOrientation.landscapeLeft) || (toInterfaceOrientation == UIInterfaceOrientation.landscapeRight)){
            
            layout.scrollDirection = UICollectionViewScrollDirection.horizontal
            numberOfColumns = 1.5
            numberOfRows = 1.0
        }
        else{
            layout.scrollDirection = UICollectionViewScrollDirection.vertical
            numberOfColumns = 2.0
            numberOfRows = (CGFloat(imageURLs.count) / 2.0)
        }
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("ARR SIZE: \(imageURLs.count)")
        return imageURLs.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
  
        let urlImage = imageURLs[indexPath.row]
        cell.imagen.imageFromURL(urlString: urlImage)
        
        return cell
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        print("CollectionView Insets")
        
        return UIEdgeInsetsMake(0,0,15,0)
        
    }
   
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = self.collectionView.frame.size.width
        let cellWidth = (collectionWidth - 50.0) / self.numberOfColumns
        let size = CGSize(width: cellWidth, height: cellWidth)
        
        return size;
    }
    
    
 

}

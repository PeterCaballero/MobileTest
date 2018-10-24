//
//  Extensions.swift
//  examenSegMano
//
//  Created by Peter Caballero on 23/10/18.
//  Copyright © 2018 Peter Caballero. All rights reserved.
//

import Foundation
import UIKit


let imageCache = NSCache<NSString, AnyObject>()

/// Clase usada para descargar o recuperar la imagen desde  internet, o de ser posible
/// desde cache
class CustomImageView: UIImageView {
    
    /// Almacena la url de donde se recupera la imagen, tambien se usa coo key para almacenar en cache
    var imgUrlString:String?
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    /// Funcion que asigna una imagen al UIImageView 
    ///Tengo codigo comentado para mostrar un indicador de carga
    /// esto depende del tipo de interaccionq ue se muestra al usuario
    public func imageFromURL(urlString: String) {
        
        imgUrlString = urlString
        
        /*
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }*/
        
        //self.image = nil
        self.image = UIImage(named: "default")
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            print("Cache")
        }else{

            URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
                if error != nil {
                    print(error ?? "No Error")
                    self.image = UIImage(named:"default")
                    return
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    let image = UIImage(data: data!)
                    //activityIndicator.removeFromSuperview()
                    
                    
                    if self.imgUrlString == urlString {
                        self.image = image
                    }
                    
                    imageCache.setObject(image!, forKey: urlString as NSString)
                    print("Download")
                })
            
            }).resume()
        }
        
        
    }
}


//
//  Extensions.swift
//  TheMoviesApp
//
//  Created by Sach on 22/02/21.
//

import UIKit

extension UIImageView {
    
    func imageFromServerURL(urlString:String, placeholderImage: UIImage) {
        if self.image == nil {
            self.image = placeholderImage
        }
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            if error != nil{
                return
            }
            DispatchQueue.main.async {
                guard let data = data else {
                    return
                }
                let image = UIImage(data:data)
                self.image = image
            }
        }.resume()
        
    }
    
}

// String Extension
extension String {
    
}

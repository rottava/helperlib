//
//  Base64.swift
//  Library
//
//  Created by Edson Rottava on 23/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class Base64 {
    class func convert (_ img: UIImage) -> String {
        guard let imageData: NSData = img.jpegData(compressionQuality: 1) as NSData? else { return "" }
        let imgString = imageData.base64EncodedString(options: .init(rawValue: 0))
        
        return imgString
    }
    
    class func revertToImage (_ imageBase64String: String?) -> UIImage {
        guard let imageData = Data.init(base64Encoded: imageBase64String ?? "", options: .init(rawValue: 0)),
              let image = UIImage(data: imageData)
              else { return UIImage() }
        
        return image
    }
}

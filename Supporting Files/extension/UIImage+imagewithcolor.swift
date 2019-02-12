//
//  UIImage+imagewithcolor.swift
//  wedding
//
//  Created by Ulises Harris on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

extension UIImage {
  
  class func imageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect: CGRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return image
  }
}

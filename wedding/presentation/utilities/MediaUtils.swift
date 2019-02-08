//
//  MediaUtils.swift
//  Vendomatica
//
//  Created by Andres Torres on 9/10/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

import Foundation
import UIKit

class MediaUtils {

  init() {}

  func compressAndToBase64(_ image: UIImage) -> String {
    let imageData = resizeImage(image, targetSize: CGSize(width: 256, height: 256)).pngData()
    return (imageData?.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters))!
  }

  func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size

    let widthRatio  = targetSize.width  / image.size.width
    let heightRatio = targetSize.height / image.size.height

    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if widthRatio > heightRatio {
      newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
      newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }

    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }

  func choosePicture(view: UIViewController, imagePicker: UIImagePickerController) {
    let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) -> Void in
      alertController.dismiss(animated: true, completion: nil)
    }))
    alertController.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { (_) -> Void in
      if UIImagePickerController.availableCaptureModes(for: .rear) != nil {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        imagePicker.cameraCaptureMode = .photo
        view.present(imagePicker, animated: true, completion: nil)

      } else {
        self.noCamera(view)
      }
    }))
    alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (_) -> Void in
      imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
      imagePicker.allowsEditing = true
      view.present(imagePicker, animated: true, completion: nil)
    }))

    view.present(alertController, animated: true, completion: nil)
  }

  func noCamera(_ view: UIViewController) {
    let alertVC = UIAlertController(title: "No Camera", message: "Sorry, this device has no camera", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertVC.addAction(okAction)
    view.present(alertVC, animated: true, completion: nil)
  }
}

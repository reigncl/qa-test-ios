//
//  Wireframe.swift
//  Vendomatica
//
//  Created by Andres Torres on 8/29/18.
//  Copyright © 2018 Abstract. All rights reserved.
//

import UIKit
import Swinject

class Wireframe {

  func detailSite(site: Site) -> Screen {
    let storyboard = UIStoryboard.init(name: "Sites", bundle: nil)
    let detailSiteVC = storyboard.instantiateViewController(withIdentifier: String(describing: DetailSiteViewController.self)) as! DetailSiteViewController
    detailSiteVC.site = site
    return Screen(viewController: detailSiteVC, isModal: false)
  }
  
  func detailPhoto(photo: Photo) -> Screen {
    let storyboard = UIStoryboard.init(name: "Photos", bundle: nil)
    let detailPhotoVC = storyboard.instantiateViewController(withIdentifier: String(describing: DetailPhotoViewController.self)) as! DetailPhotoViewController
    detailPhotoVC.photo = photo
    return Screen(viewController: detailPhotoVC, isModal: false)
  }
  
  func addPhoto(delegate: AddPhotoDelegate) -> Screen {
    let storyboard = UIStoryboard.init(name: "Photos", bundle: nil)
    let addPhotoVC = storyboard.instantiateViewController(withIdentifier: String(describing: AddPhotoViewController.self)) as! AddPhotoViewController
    addPhotoVC.delegate = delegate
    return Screen(viewController: addPhotoVC, isModal: false)
  }
  
  func showWishDetail(parent: UIViewController, wish: Wish) {
    let storyboard = UIStoryboard.init(name: "Wish", bundle: nil)
    let wishDetail = storyboard.instantiateViewController(withIdentifier: String(describing: DetailWishViewController.self)) as! DetailWishViewController
    wishDetail.wish = wish
    parent.addChild(wishDetail)
    wishDetail.view.frame = parent.view.frame
    parent.view.addSubview(wishDetail.view)
    wishDetail.didMove(toParent: parent)
  }
  
  func showWishCreate(parent: UIViewController, listener: CreateWishDelegate) {
    let storyboard = UIStoryboard.init(name: "Wish", bundle: nil)
    let wishCreate = storyboard.instantiateViewController(withIdentifier: String(describing: CreateWishViewController.self)) as! CreateWishViewController
    wishCreate.listener = listener
    parent.addChild(wishCreate)
    wishCreate.view.frame = parent.view.frame
    parent.view.addSubview(wishCreate.view)
    wishCreate.didMove(toParent: parent)
  }
  
  func popCurrentScreen(_ completion: @escaping (() -> Void) = { }) {
    // Pop if there is a Navigation Controller
    if let navigationController = UIApplication.topViewController()?.parent as? UINavigationController, navigationController.viewControllers.count > 1 {
      navigationController.popViewController(animated: true)
    } else { // If not, dismiss
      UIApplication.topViewController()?.dismiss(animated: true, completion: completion)
    }
  }
  
  func dismissController(animated: Bool = true, completion: (() -> Void)?) {
    UIApplication.topViewController()?.dismiss(animated: animated, completion: {
      completion?()
    })
  }
}

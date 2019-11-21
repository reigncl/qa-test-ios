//
//  PhotosViewController.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

class PhotosViewController: BaseViewController<PhotosPresenter>, PhotosView, AddPhotoDelegate {

  @IBOutlet var photoCollectionView: UICollectionView!
  
  var dataSource: PhotosCollectionViewDataSource?
  var delegate: PhotosCollectionViewDelegate?
  
  var photos = [Photo]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let barButton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(addPhoto))
    barButton.tintColor = UIColor.orangeEvent
    navigationItem.rightBarButtonItem = barButton
    
    dataSource = PhotosCollectionViewDataSource(photos: photos)
    delegate = PhotosCollectionViewDelegate(onPhotoSelected: { (index) in
      self.wireframe.detailPhoto(photo: self.photos[index]).show()
    })
    
    photoCollectionView.dataSource = dataSource
    photoCollectionView.delegate = delegate
    
    presenter.attemptPhotos()
  }
  
  @objc func addPhoto(){
    wireframe.addPhoto(delegate: self).show()
  }
  
  func photosSuccessfully(_ photos: [Photo]) {
    self.photos = photos
    dataSource?.photos = photos
    photoCollectionView.reloadData()
  }
  
  func addPhotoCollection(_ photo: Photo) {
    self.photos.append(photo)
    dataSource?.photos.append(photo)
    photoCollectionView.reloadData()
  }
}

//
//  PresentationModule.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

// swiftlint:disable function_body_length

import Swinject
import SwinjectStoryboard

class PresentationModule {
  
  static func setup(_ defaultContainer: Container) {
    
    defaultContainer.register(Wireframe.self) { _ in Wireframe() }
      .inObjectScope(.container)
    
    defaultContainer.register(MediaUtils.self) { _ in MediaUtils() }
      .inObjectScope(.container)
    
    resolvePresenters(defaultContainer)
    resolveViewControllers(defaultContainer)
  }
  
  static func resolveViewControllers(_ defaultContainer: Container) {
    
    defaultContainer.storyboardInitCompleted(UINavigationController.self) { _, _ in }
    
    defaultContainer.storyboardInitCompleted(PhotosViewController.self) { r, c in
      c.presenter = r.resolve(PhotosPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(SitesViewController.self) { r, c in
      c.presenter = r.resolve(SitesPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(WishesViewController.self) { r, c in
      c.presenter = r.resolve(WishesPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(CreateWishViewController.self) { r, c in
      c.presenter = r.resolve(BasePresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(DetailWishViewController.self) { r, c in
      c.presenter = r.resolve(BasePresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(AddPhotoViewController.self) { r, c in
      c.presenter = r.resolve(AddPhotoPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(DetailPhotoViewController.self) { r, c in
      c.presenter = r.resolve(BasePresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(DetailSiteViewController.self) { r, c in
      c.presenter = r.resolve(BasePresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(HomeViewController.self) { r, c in
      c.presenter = r.resolve(BasePresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
    
    defaultContainer.storyboardInitCompleted(RegisterViewController.self) { r, c in
      c.presenter = r.resolve(RegisterPresenter.self)!
      c.wireframe = r.resolve(Wireframe.self)!
    }
  }
  
  static func resolvePresenters(_ defaultContainer: Container) {
    defaultContainer.register(BasePresenter.self) { _ in
      BasePresenter()
    }
    
    defaultContainer.register(PhotosPresenter.self) { r in
      PhotosPresenter(repository: r.resolve(PhotosRepository.self)!)
    }
    
    defaultContainer.register(SitesPresenter.self) { r in
      SitesPresenter(repository: r.resolve(SitesRepository.self)!)
    }
    
    defaultContainer.register(WishesPresenter.self) { r in
      WishesPresenter(repository: r.resolve(WishesRepository.self)!)
    }
    
    defaultContainer.register(AddPhotoPresenter.self) { r in
      AddPhotoPresenter(repository: r.resolve(PhotosRepository.self)!, mediaUtils: r.resolve(MediaUtils.self)!)
    }
    
    defaultContainer.register(RegisterPresenter.self) { r in
      RegisterPresenter(repository: r.resolve(UserRepository.self)!)
    }
  }
}

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
  }
  
  static func resolvePresenters(_ defaultContainer: Container) {
    defaultContainer.register(BasePresenter.self) { _ in
      BasePresenter()
    }
  }
}

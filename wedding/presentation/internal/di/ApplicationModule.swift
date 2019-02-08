//
//  ApplicationModule.swift
//  wedding
//
//  Created by Abstract on 2/8/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
  
  class func setup() {
    DataModule.setup(defaultContainer)
    PresentationModule.setup(defaultContainer)
  }
}

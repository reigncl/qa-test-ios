//
//  GiftRepository.swift
//  wedding
//
//  Created by Abstract on 2/12/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import Foundation

class GiftRepository: NSObject {
  
  func getGifts(completion: ((_ photos: [Gift]) -> Void)?){
    
    var gifts = [Gift]()
    
    let facebankGift = Gift()
    facebankGift.bank = "Facebank"
    facebankGift.number = "21580007537"
    facebankGift.aba = "ABA: 021502189"
    facebankGift.swift = "SWIFT: FILCPR22"
    facebankGift.name = "Ariana Emilia Cabrera Acevedo"
    facebankGift.address = "Dirección: 17 Road 2 Suite 600, Metro Office Park Guaynabo, Puerto Rico 00968-1745"
    gifts.append(facebankGift)
    
    let zelleGift = Gift()
    zelleGift.bank = "Zelle"
    zelleGift.number = "Elías Tarbay"
    zelleGift.aba = "ertr407@gmail.com"
    gifts.append(zelleGift)
    
    let mercantilGift = Gift()
    mercantilGift.bank = "Banco Mercantil"
    mercantilGift.number = "0105 0230 611230074708"
    mercantilGift.aba = "Elías Tarbay"
    mercantilGift.swift = "CI: 19.682.573"
    mercantilGift.name = "ertr407@gmail.com"
    gifts.append(mercantilGift)
    
    completion?(gifts)
  }
}

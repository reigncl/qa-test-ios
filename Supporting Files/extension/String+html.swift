//
//  String+html.swift
//  wedding
//
//  Created by Ulises Harris on 2/11/19.
//  Copyright © 2019 uharris. All rights reserved.
//

import UIKit

extension String{
  var html2AttributedString: NSAttributedString? {
    do {
      return try NSAttributedString(data: Data(utf8),
                                    options: [.documentType: NSAttributedString.DocumentType.html,
                                              .characterEncoding: String.Encoding.utf8.rawValue],
                                    documentAttributes: nil)
    } catch {
      print("error: ", error)
      return nil
    }
  }
  var html2String: String {
    return html2AttributedString?.string ?? ""
  }
}

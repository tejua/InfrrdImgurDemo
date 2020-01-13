//
//  AllExtensions.swift
//  DemoProject
//
//  Created by vLinkD on 23/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//


import Foundation
import ObjectiveC
import UIKit


extension String {
    public var trimmed: String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
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
        return self.html2AttributedString?.string ?? ""
    }
    
    //public
}


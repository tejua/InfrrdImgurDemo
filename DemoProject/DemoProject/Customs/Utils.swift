//
//  Utils.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import Foundation
import UIKit

struct Utils {
   static func verifyUrl(urlString: String?) -> Bool {
        guard let urlString = urlString,
            let url = URL(string: urlString) else {
                return false
        }
        
        return UIApplication.shared.canOpenURL(url)
    }
    
   static func formatPoints(num: Int) ->String{
        let thousandNum = num/1000
        let millionNum = num/1000000
        if num >= 1000 && num < 1000000{
            if(thousandNum == thousandNum){
                return("\(thousandNum)k")
            }
            return("\(thousandNum)k")
        }
        if num > 1000000{
            if(millionNum == millionNum){
                return("\(Int(thousandNum))k")
            }
            return ("\(millionNum)M")
        }
        else{
            if(num == num){
                return ("\(num)")
            }
            return ("\(num)")
        }
        
    }
    
}

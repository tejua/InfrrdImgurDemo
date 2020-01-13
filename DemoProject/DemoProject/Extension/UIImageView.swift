//
//  File.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import UIKit
import AlamofireImage
import SwiftyGif

extension UIImageView {
    func setImageFrom(url: String?, placeholder: UIImage? = nil) {
        if let url = url?.trimmed {
            let arryExt = url.components(separatedBy: ".")
            guard let stxt = arryExt.last else {
                return
            }
            if stxt.uppercased().contains("GIF") || stxt.uppercased().contains("GIFV") {
                let gifManager = SwiftyGifManager(memoryLimit: 50)
                guard let url = URL(string: url) else {
                    return
                }
                self.setGifFromURL(url, manager: gifManager, levelOfIntegrity: .highestNoFrameSkipping)
            } else {
                self.image = placeholder
                if let urlObj = URL(string: url) {
                    af_setImage(withURL: urlObj, placeholderImage: placeholder, filter: nil, progress: nil, imageTransition: UIImageView.ImageTransition.crossDissolve(0.3),
                                runImageTransitionIfCached: true)
                    self.setNeedsDisplay()
                } }
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
}

//
//  ImageView.swift
//  DemoProject
//
//  Created by vLinkD on 11/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import UIKit
class CircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.cornerRadius = frame.height / 2
    }
}

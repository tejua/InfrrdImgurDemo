//
//  File.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import Foundation
import UIKit

class ImageTableHeaderView: UIView {
    private var imageView: UIImageView!
    private var lblViews: UILabel!
    var looper: Looper?
    required init(tableView: UITableView, imageData: Images) {
        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.width + 50)
        super.init(frame: frame)
        looper?.stop()
        // remove first notification to stop player
        NotificationCenter.default.removeObserver(self, name: Notification.Name("stopLooper"), object: nil)
        
         // Add notification to stop player
        NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)), name: Notification.Name("stopLooper"), object: nil)
        
        print(imageData.toJSON())
        backgroundColor = UIColor(hex: "33353A")
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.width))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        if imageData.type == .video {
            if let imgUrl = imageData.mp4?.trimmed {
                let videoUrl = URL(string: imgUrl)
                looper = Looper(videoURL: videoUrl!)
                looper?.start(in: imageView.layer)
            }
        } else {
            if let imgUrl = imageData.link?.trimmed {
                imageView.setImageFrom(url: imgUrl)
            }
        }
        addSubview(imageView)
        lblViews = UILabel(frame: CGRect(x: 10, y: self.frame.height - 40, width: 250, height: 30))
        lblViews.text = Utils.formatPoints(num: imageData.views) + " views"
        lblViews.textColor = .lightGray
        lblViews.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        addSubview(lblViews)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        looper?.stop()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

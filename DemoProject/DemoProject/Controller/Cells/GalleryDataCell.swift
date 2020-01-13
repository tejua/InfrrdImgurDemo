//
//  GalleryDataCell.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//
import UIKit

class GalleryDataCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPoints: UILabel!
    var looper: Looper?
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 5
    }
    
    func setData(data: Gallery) {
        guard let imageData = data.images?.first else {
            return
        }
        if imageData.type == .video {
            if let imgUrl = imageData.mp4?.trimmed {
                imgIcon.setImageFrom(url: imgUrl)
                let videoUrl = URL.init(string: imgUrl)
                looper = Looper(videoURL: videoUrl!)
            }
            
          
        } else {
            if let imgUrl = imageData.link?.trimmed {
                imgIcon.setImageFrom(url: imgUrl)
            }
        }
        imgIcon.backgroundColor = .red
        imgIcon.roundCorners(corners: [.topLeft, .topRight], radius: 5.0)
        lblTitle.text = data.title
        if let points = data.points {
            lblPoints.text = Utils.formatPoints(num: points) + " Points"
        }
    }
}

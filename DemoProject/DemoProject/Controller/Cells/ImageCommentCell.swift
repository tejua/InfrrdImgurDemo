//
//  File12.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import UIKit

class ImageCommentCell: UITableViewCell {
    @IBOutlet weak var txtViewComment: UIView!
    @IBOutlet weak var imageViewComment: UIView!
    @IBOutlet weak var imageComment: UIImageView!
    @IBOutlet weak var topAddCommentView: UIView!
    @IBOutlet weak var profileIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var upPoints: UILabel!
    @IBOutlet weak var downPoints: UILabel!
    @IBOutlet weak var btnReply: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(data: CommentData) {
        if let commentStr = data.comment, Utils.verifyUrl(urlString: commentStr) {
            imageViewComment.isHidden = false
            txtViewComment.isHidden = true
            imageComment.setImageFrom(url: commentStr)
        } else {
            txtViewComment.isHidden = false
            imageViewComment.isHidden = true
            lblComment.text = data.comment
        }
        if let upPoint = data.ups {
            upPoints.text = Utils.formatPoints(num: upPoint)
        }
        if let downsPoint = data.downs {
            downPoints.text = Utils.formatPoints(num: downsPoint)
        }
        let replyCount = data.childrenComment.count
        if replyCount > 0 {
            btnReply.isHidden = false
            btnReply.titleLabel?.text = "\(1) Reply"
        } else {
            btnReply.isHidden = true
        }
    }
    
    @IBAction func addAction(sender : UIButton) {
        // Alert.init(title: "No Internet").show()
    }
}

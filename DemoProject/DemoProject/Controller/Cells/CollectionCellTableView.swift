//
//  CollectionCellTableView.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import UIKit

class CollectionCellTableView: UICollectionViewCell {
    @IBOutlet weak var tableView: UITableView!
    var inputImageData = Gallery()
    let commentObj = CommentVM()
    var parantsVC: DetailsVC!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

     func setData(data: Gallery) {
        DispatchQueue.main.async {
            self.inputImageData = data
            self.parantsVC.navTitle.text = data.title
            self.tableView.sectionHeaderHeight = 300
            self.getComments(imageId: data.id ?? "")
        }
    }

    // Call api for fetching comment
    private func getComments(imageId: String) {
         NotificationCenter.default.post(name: Notification.Name("stopLooper"), object: nil, userInfo: nil)
        commentObj.imageId = imageId
        commentObj.getGalleyComments { isSuc in
            if isSuc {
                self.tableView.dataSource = self
                self.tableView.delegate = self
                self.tableView.reloadData()
            }
        }
    }
    

}

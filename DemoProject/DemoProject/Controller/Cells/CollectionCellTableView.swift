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

// In CollectiionViewCell add tableview delegates
extension CollectionCellTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let imageData = inputImageData.images?.first else {
            return UIView()
        }
     //   print("images" , inputImageData.images?.toJSON())
        let head = ImageTableHeaderView(tableView: tableView, imageData: imageData)
        return head
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.width + 50
    }
}

// In CollectiionViewCell add tableview datasource
extension CollectionCellTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentObj.commentData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(type: ImageCommentCell.self)
        if indexPath.row == 0 {
            cell.topAddCommentView.isHidden = false
        } else {
            cell.topAddCommentView.isHidden = true
        }
        cell.setData(data: commentObj.commentData[indexPath.row])
        return cell
    }
}

//
//  ImageGalleryVC.swift
//  Kirra
//
//  Created by vLinkD on 16/12/19.
//  Copyright © 2019 vLinkD. All rights reserved.

import Foundation
import UIKit

class DetailsVC: UIViewController, UICollectionViewDelegateFlowLayout {
   // var inputImageData = Gallery()
    var galleryObj = GalleryVM()
    var inputIndexPath: IndexPath!
    var isShowFlag = true
    weak var delegates: ImageTableHeaderView?
    @IBOutlet weak var navTitle: UILabel!
    @IBOutlet weak var viewNavigation: UIView!
    @IBOutlet weak var viewNavigationTime: UIView!

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        collectionView.isPagingEnabled = true
        collectionView.delegate = self
    }

    @IBAction func backAction(sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("stopLooper"), object: nil, userInfo: nil)
        navigationController?.popViewController(animated: true)
        navigationController?.isNavigationBarHidden = false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

// In DetailsVC add collectionView Datasource

extension DetailsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryObj.galleryData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: CollectionCellTableView.self, indexPath: indexPath)
        cell.parantsVC = self
        cell.setData(data: galleryObj.galleryData[indexPath.row])
        return cell
    }
}

// In DetailsVC add collectionView delegates
extension DetailsVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isShowFlag {
            collectionView.scrollToItem(at: inputIndexPath, at: .left, animated: false)
            isShowFlag = false
        }
    }
}

// In CollectiionViewCell add tableview delegates
extension CollectionCellTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let imageData = inputImageData.images?.first else {
            return UIView()
        }
        print("images" , inputImageData.images?.toJSON())
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

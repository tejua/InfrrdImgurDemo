
//  DemoProject
//
//  Created by vLinkD on 30/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    let galleryObj = GalleryVM()
    @IBOutlet weak var collectionView: UICollectionView!
    var pageCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        fetchAllDetails()
        setupCollectionViewInsets()
        setupLayout()

        navigationController?.navigationBar.setGradientBackground(colors: [UIColor(hex: "397195"), UIColor(hex: "4AA069")], startPoint: .topLeft, endPoint: .topRight)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = "Most Viral"
        navigationController?.isNavigationBarHidden = false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func fetchAllDetails() {
        galleryObj.pageCount = "\(pageCount)"
        galleryObj.getMostViralImages { isSuc in
            if !isSuc {
                self.galleryObj.galleryData.removeAll()
            }
            self.collectionView.reloadData()
        }
    }

    func setupCollectionViewInsets() {
        collectionView!.backgroundColor = .black
    }

    func setupLayout() {
        let layout: PinterestLayout = {
            if let layout = UICollectionViewLayout() as? PinterestLayout {
                return layout
            }
            let layout = PinterestLayout()

            collectionView?.collectionViewLayout = layout

            return layout
        }()
        layout.delegate = self
        layout.cellPadding = 2
        layout.numberOfColumns = 2
    }
}

// MARK: collectionView view Data Source

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryObj.galleryData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: GalleryDataCell.self, indexPath: indexPath)
        cell.setData(data: galleryObj.galleryData[indexPath.row])
        return cell
    }
}

// MARK: collectionView view Delegate

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vcDetails = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        //vcDetails.inputImageData = galleryObj.galleryData[indexPath.row]
        vcDetails.galleryObj = galleryObj
        vcDetails.inputIndexPath = indexPath

        show(vcDetails, sender: self)
    }

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
      
        if indexPath.row == galleryObj.galleryData.count - 1 { // it's your
            pageCount += 1
            fetchAllDetails()
        }
    }

}

extension ViewController: PinterestLayoutDelegate {
    func collectionView(collectionView: UICollectionView,
                        heightForImageAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat {
//        let item = galleryObj.galleryData[indexPath.row].images?.first
//        if let imgHeight = item?.height, let imgWidth = item?.width {
//            if imgWidth == imgHeight {
//                return (collectionView.frame.width / 2) + 70
//            } else if imgWidth > imgHeight {
//                return (collectionView.frame.width / 2)
//            } else {
//                return (collectionView.frame.width / 2) + 110
//            }
//        }
        if indexPath.row % 2 == 0 {
            return 200
        }
        return 250
    }

    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath,
                        withWidth: CGFloat) -> CGFloat {
        return 0
    }
}

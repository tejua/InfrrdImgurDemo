//
//  UICollectionView.swift
//  DemoProject
//
//  Created by vLinkD on 11/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.

import UIKit

extension UICollectionView {
    
    func dequeueReusableCell<T>(type: T.Type, indexPath: IndexPath) -> T {
        let id = String(describing: type)
        guard let cell = dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as? T else {
            fatalError("collectionViewCell not found")
        }
        return cell
    }
    
}

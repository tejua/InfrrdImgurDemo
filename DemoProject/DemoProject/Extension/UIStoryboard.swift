//
//  StoryBoard.swift
//  DemoProject
//
//  Created by vLinkD on 11/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import UIKit

extension UIStoryboard {
	func instantiateViewController<T>(type: T.Type) -> T {
		let id = String(describing: type)
		print("StoryBoard id: \(id)")
        guard let viewController = instantiateViewController(withIdentifier: id) as? T else {
            fatalError("ViewController not found")
        }
        return viewController
	}
}

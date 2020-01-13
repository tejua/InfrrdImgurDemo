//
//  TableViewExtension.swift
//  DemoProject
//
//  Created by vLinkD on 11/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.

import UIKit

public extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type) -> T {
        let identifier = String(describing: type)
        if let reusableCell = self.dequeueReusableCell(withIdentifier: identifier) {
            if let cell = reusableCell as? T {
                return cell
            } else {
                print("tableview cell cannot be casted: \(identifier)")
            }
        } else {
            print("tableview cell not found: \(identifier)")
        }
        guard let tableViewCell = UITableViewCell() as? T else {
            fatalError("tableviewcell not found")
        }
        return tableViewCell
    }
   
    
}

//
//  CommentVM.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//

import SVProgressHUD
import Foundation
class CommentVM: NSObject {
    var commentData: [CommentData] = []
    var imageId: String = ""
    private func getUrl() -> String {
        return baseCommentUrl + "\(imageId)/comments"
    }
    
    typealias FetchCompletion = ((_ isSuccess: Bool) -> Void)
    func getGalleyComments(completion: @escaping FetchCompletion) {
        SVProgressHUD.show()
        ImageClass.getGalleyComment(searchURL: getUrl(), params: [:]) { res, data in
            SVProgressHUD.dismiss()
            if let datas = data, datas.success  {
                self.commentData = datas.commentData
                completion(true)
                return
            }
            //if let msg = data?.error {
            MyAlert.showError(message: "Something went wrong")
            //}
            completion(false)
            
        }
    }
}

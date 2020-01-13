
//  DemoProject
//
//  Created by vLinkD on 30/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//
import SVProgressHUD

import Foundation
class GalleryVM: NSObject {
    var galleryData: [Gallery] = []
    private func getUrl() -> String {
      return baseUrl
    }
    
    typealias FetchCompletion = ((_ isSuccess: Bool) -> Void)
    func getSearchMovies(completion: @escaping FetchCompletion) {
        SVProgressHUD.show()
        SearchClass.getSearchMovies(searchURL: getUrl(), params: [:]) { res, data in
            SVProgressHUD.dismiss()
         
            if let datas = data, datas.success  {
               self.galleryData = datas.gallery
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

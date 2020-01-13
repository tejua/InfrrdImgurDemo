
//  DemoProject
//
//  Created by vLinkD on 30/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//

import SVProgressHUD
import Foundation
class GalleryVM: NSObject {
    var galleryData: [Gallery] = []
    var pageCount: String = "0"
    private func getUrl() -> String {
        return baseUrl + pageCount
        
    }
    
    typealias FetchCompletion = ((_ isSuccess: Bool) -> Void)
    func getMostViralImages(completion: @escaping FetchCompletion) {
        SVProgressHUD.show()
        ImageClass.getMostViralImage(searchURL: getUrl(), params: [:]) { res, data in
            SVProgressHUD.dismiss()
            if let datas = data, datas.success  {
                
                // stop mp4 url
                let dataArr = datas.gallery.filter({ $0.images?.first?.type != .video})
                self.galleryData =  self.galleryData + dataArr
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

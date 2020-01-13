
//  DemoProject
//
//  Created by vLinkD on 30/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//

import Foundation

let baseUrl = "https://api.imgur.com/3/gallery/hot/viral/"

let baseCommentUrl = "https://api.imgur.com/3/gallery/"

struct ImageClass {
    static func getMostViralImage(searchURL: String, params: [String: Any], handler: @escaping ResponseHandler<RootData>) {
        ApiRequest.GET(url: searchURL, params: params, handler: handler, isRoot: true)
    }
    
    static func getGalleyComment(searchURL: String, params: [String: Any], handler: @escaping ResponseHandler<RootComment>) {
        ApiRequest.GET(url: searchURL, params: params, handler: handler, isRoot: true)
    }
}

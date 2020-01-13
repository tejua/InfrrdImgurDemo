
//  DemoProject
//
//  Created by vLinkD on 30/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//

import ObjectMapper
import UIKit

class RootData: Mappable {
    var status: Int?
    var gallery: [Gallery] = []
    var success: Bool = false
    
    
    required init?( map: Map) {
    }
    
    func mapping(map: Map) {
        status    <- map["status"]
        gallery    <- map["data"]
        success    <- map["success"]
    }
}


class Gallery: Mappable {
    var link: String?
    var score: Int?
    var in_gallery: Bool?
    var id: String?
    var title: String?
    var cover: String?
    var ad_url: String?
    var is_ad: Bool?
    var cover_height: Int?
    var layout: String?
    var favorite_count: Int?
    var points: Int?
    var topic_id: Int?
    var account_url: String?
    var cover_width: Int?
    var datetime: Int?
    var include_album_ads: Bool?
    var topic: String?
    var comment_count: Int?
    var account_id: Int?
    var privacy: String?
    var favorite: Bool?
    var section: String?
    var in_most_viral: Bool?
    var nsfw: Bool?
    var views: Int?
    var images: [Images]?
    var downs: Int?
    var is_album: Bool?
    var ups: Int?
    var ad_type: Int?
    var typeGallery: String?
    var images_count: Int?
    
    init() {
    }
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        link    <- map["link"]
        score    <- map["score"]
        in_gallery    <- map["in_gallery"]
        id    <- map["id"]
        title    <- map["title"]
        cover    <- map["cover"]
        ad_url    <- map["ad_url"]
        is_ad    <- map["is_ad"]
        cover_height    <- map["cover_height"]
        layout    <- map["layout"]
        favorite_count    <- map["favorite_count"]
        points    <- map["points"]
        topic_id    <- map["topic_id"]
        account_url    <- map["account_url"]
        cover_width    <- map["cover_width"]
        datetime    <- map["datetime"]
        include_album_ads    <- map["include_album_ads"]
        topic    <- map["topic"]
        comment_count    <- map["comment_count"]
        account_id    <- map["account_id"]
        privacy    <- map["privacy"]
        favorite    <- map["favorite"]
        section    <- map["section"]
        in_most_viral    <- map["in_most_viral"]
        nsfw    <- map["nsfw"]
        typeGallery <- map["type"]
        views    <- map["views"]
        images    <- map["images"]
        downs    <- map["downs"]
        is_album    <- map["is_album"]
        ups    <- map["ups"]
        ad_type    <- map["ad_type"]
        images_count    <- map["images_count"]
    }
}

class Images: Mappable {
    var animated: Bool?
    var link: String?
    var mp4: String?
    var gifv: String?
    var width: Int = 0
    var in_gallery: Bool?
    var type: TypeGallery!
    var bandwidth: Double?
    var size: Int?
    var id: String?
    var height: Int = 0
    var views: Int = 0
    var datetime: Int?
    
    
    required init?( map: Map) {
    }
    
    func mapping(map: Map) {
        animated    <- map["animated"]
        link    <- map["link"]
        gifv    <- map["gifv"]
        mp4    <- map["mp4"]
        width    <- map["width"]
        in_gallery    <- map["in_gallery"]
        type    <- map["type"]
        bandwidth    <- map["bandwidth"]
        size    <- map["size"]
        id    <- map["id"]
        height    <- map["height"]
        views    <- map["views"]
        datetime    <- map["datetime"]
    }
}


enum TypeGallery: String {
    case video = "video/mp4"
    case imagejpeg = "image/jpeg"
    case imagepng = "image/png"
    case imgegif = "image/gif"

}


//
//  CommentData.swift
//  DemoProject
//
//  Created by vLinkD on 12/01/20.
//  Copyright © 2020 vLinkD. All rights reserved.
//
import ObjectMapper

class RootComment: Mappable {
    var status: Int?
    var commentData: [CommentData] = []
    var success: Bool = false
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        status    <- map["status"]
        commentData    <- map["data"]
        success    <- map["success"]
    }
}

class CommentData: Mappable {
    var platform: String?
    var album_cover: String?
    var childrenComment: [ChildrenCommentData] = []
    var on_album: Bool?
    var deleted: Bool?
    var image_id: String?
    var id: Int?
    var author: String?
    var downs: Int?
    var author_id: Int?
    var points: Int?
    var comment: String?
    var ups: Int?
    var datetime: Int?
    var parent_id: Int?
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        platform    <- map["platform"]
        album_cover    <- map["album_cover"]
        childrenComment    <- map["children"]
        on_album    <- map["on_album"]
        deleted    <- map["deleted"]
        image_id    <- map["image_id"]
        id    <- map["id"]
        author    <- map["author"]
        downs    <- map["downs"]
        author_id    <- map["author_id"]
        points    <- map["points"]
        comment    <- map["comment"]
        ups    <- map["ups"]
        datetime    <- map["datetime"]
        parent_id    <- map["parent_id"]
    }
}


class ChildrenCommentData: Mappable {
    var platform: String?
    var album_cover: String?
    var childrenComment: [ChildrenCommentData]?
    var on_album: Bool?
    var deleted: Bool?
    var image_id: String?
    var id: Int?
    var author: String?
    var downs: Int?
    var author_id: Int?
    var points: Int?
    var comment: String?
    var ups: Int?
    var datetime: Int?
    var parent_id: Int?
    
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        platform    <- map["platform"]
        album_cover    <- map["album_cover"]
        childrenComment    <- map["children"]
        on_album    <- map["on_album"]
        deleted    <- map["deleted"]
        image_id    <- map["image_id"]
        id    <- map["id"]
        author    <- map["author"]
        downs    <- map["downs"]
        author_id    <- map["author_id"]
        points    <- map["points"]
        comment    <- map["comment"]
        ups    <- map["ups"]
        datetime    <- map["datetime"]
        parent_id    <- map["parent_id"]
    }
}


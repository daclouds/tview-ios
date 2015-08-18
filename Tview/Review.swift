//
//  Review.swift
//  Tview
//
//  Created by daclouds on 2015. 8. 11..
//
//

import UIKit

class Review {
    
    var seriesId: String
    var objectId: String
    var comment: String
    var author: String
    
    init?(seriesId: String, objectId: String, comment: String, author: String) {
        self.seriesId = seriesId
        self.objectId = objectId
        self.comment = comment
        self.author = author
    }
}

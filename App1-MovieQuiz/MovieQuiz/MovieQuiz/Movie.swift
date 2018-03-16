//
//  Movie.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 3/4/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import UIKit
class Movie : NSObject{
    var images: String
    var title: String
    var type: String
    
    init(images: String, title: String, type: String){
        self.images = images
        self.title = title
        self.type = type
        
        super.init()
    }
}

//
//  MovieStore.swift
//  MovieQuiz
//
//  Created by Nguyen Tran on 3/4/18.
//  Copyright © 2018 Nguyen Tran. All rights reserved.
//

import Foundation

enum movieCategory : String{
    case gerne = "gerne"
    case year = "year"
    case actor = "actor"
}

class nameType : NSObject{
    var images: String
    var name: String
    var type: movieCategory
    
    init(images: String, name: String, type: movieCategory){
        self.images = images
        self.name = name
        self.type = type
        
        super.init()
    }
    
}
class MovieStore {
    //var moviess : [NSObject]
    var movies: [Movie] = []
    let arrayheader: Array<String> = ["Genre","Actors","Year"]
    
    init(){
       


    }
}

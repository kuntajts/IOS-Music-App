//
//  Song.swift
//  IOS Music App
//
//  Created by Charles Woodward on 2/8/15.
//  Copyright (c) 2015 Sugr. All rights reserved.
//

import Foundation

class Song {
    var name: String
    var artist: String
    var album: String
    var year: Int
    var composer: String
    var length: Int
    
    init(name: String, artist: String, album: String, year: Int, composer: String, length: Int){
        self.name = name
        self.artist = artist
        self.album = album
        self.year = year
        self.composer = composer
        self.length = length
    }
}
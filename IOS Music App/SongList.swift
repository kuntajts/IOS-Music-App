//
//  File.swift
//  IOS Music App
//
//  Created by Charles Woodward on 2/8/15.
//  Copyright (c) 2015 Sugr. All rights reserved.
//

import Foundation

class SongList {
    var songDictionary:[String: Song]
    
    init(){
        self.songDictionary = [String: Song]()
    }
    
    func addSong (var name: String, artist: String, album: String, year: Int, composer: String, length: Int) {
        let newSong = Song(name: name, artist: artist, album: album, year: year, composer: composer, length: length)
        name = name.lowercaseString
        songDictionary[name] = newSong
    }
    
    func removeSong(name: String) {
        let songToRemove = name.lowercaseString
        songDictionary.removeValueForKey(songToRemove)
    }
    
    func print() -> [Song] {
        var songList: [Song] = []
        for song in songDictionary.values {
            songList.append(song)
        }
        let sortedSongs = songList.sorted { $0.name < $1.name }
        
        return sortedSongs
    }
    
    func print(var artist: String) -> [Song] {
        artist = artist.lowercaseString
        var result: [Song] = []
        for song in songDictionary.values {
            if song.artist.lowercaseString == artist {
                result.append(song)
            }
        }
        
        return result
    }
}
//
//  File.swift
//  IOS Music App
//
//  Created by Charles Woodward, Sam Kamenetz, Jordan Smith and Kal Popzlatev on 2/8/15.
//  Copyright (c) 2015 Sugr. All rights reserved.
//  Class SongList encapsulates data for an array of songs
//  class vars: songDictionary - indexes instances of class Song with the name of the song;

import Foundation

class SongList {
    var songDictionary:[String: Song]
    
    //constructor:
    init(){
        
        self.songDictionary = [String: Song]()
    }
    
    
    //Func addSong
    //parameters in: string name - name of song;
    //string artist - name of artist;
    //string album - name of album containing the song;
    //Int year - year the song was released;
    //string composer: name of the composer;
    //int length - duration of song in seconds;
    //creates an instance of the Song class and adds it to dictionary using the lowercase for the name of the song as a key
    //Created by Charles Woodward;
    func addSong (var name: String, artist: String, album: String, year: Int, composer: String, length: Int) {
        
        let newSong = Song(name: name, artist: artist, album: album, year: year, composer: composer, length: length)
        name = name.lowercaseString
        songDictionary[name] = newSong
    }
    //Func removeSong
    //parameters in: string name - name of the song
    //uses the passed parameter as a key to remove the associated value
    //Created by Sam Kamenetz
    func removeSong(name: String) {

        let songToRemove = name.lowercaseString
        songDictionary.removeValueForKey(songToRemove)
    }
    //Func print
    //return value: sortedSongs: [Song] list of songs (instances of class Song)
    //internal vars: songList: [Song] - list of songs
    //loops through the songDictionary and adds every song to a list;
    //sorts the names alphabetically;
    //created by Jordan Smith
    func print() -> [Song] {

        var songList: [Song] = []
        for song in songDictionary.values {
            songList.append(song)
        }
        let sortedSongs = songList.sorted { $0.name < $1.name } //alphabetical sorting;
        
        return sortedSongs
    }
    //Func print(artist)
    //parameters in: string artist - name of artist whose songs are to be displayed
    //return value: result-list of Songs
    //loops through dictionary and only appends if the artist name is matched
    //created by Kal Popzlatev
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
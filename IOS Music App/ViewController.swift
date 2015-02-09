//
//  ViewController.swift
//  IOS Music App
//
//  Created by Charles Woodward, Sam Kamenetz, Jordan Smith and Kal Popzlatev on 2/8/15.
//  Copyright (c) 2015 Sugr. All rights reserved.
// Creates a User Interface for the the Song/SongList model


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var songNameField: UITextField! //input field for song name
    @IBOutlet var artistField: UITextField! //input field for artist name
    @IBOutlet var albumField: UITextField! //input field for album name
    @IBOutlet var composerField: UITextField! //input field for composer name
    @IBOutlet var lengthSlider: UISlider! //user interface slider (song duration in seconds)
    @IBOutlet var yearStepper: UIStepper!// stepper (year of release)
    @IBOutlet var yearLabel: UILabel! //yearLabel displays the year specified by stepper
    @IBOutlet var lengthLabel: UILabel!//lengthLabel displays duration specified by slider
    @IBOutlet var resultsField: UITextView! //resultsField-text view displaying the results after clicking
    @IBOutlet var artistPrintField: UITextField! //input for artist name when attempting to display the songs for a specific artist
    
    let mySongList = SongList()
    
    func refreshUI(){
        //connects labels to the respective feature (slider for duration and stepper for year)
      
        yearLabel.text=String(format: "Year (%d)",Int(yearStepper.value))
        lengthLabel.text=String(format: "Length (%d) s",Int(lengthSlider.value))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yearChanged(sender: AnyObject){
        refreshUI()
    }
    @IBAction func lengthChanged(sender: AnyObject){
        refreshUI()
        
    }
    @IBAction func addClicked(sender: AnyObject){
        //connects action of clicking add button to the add function in Song/SongList model
        //created by Jordan Smith
        mySongList.addSong(songNameField.text, artist: artistField.text, album: albumField.text, year: Int(yearStepper.value), composer: composerField.text, length: Int(lengthSlider.value))
        
        songNameField.text=""
        artistField.text=""
        albumField.text=""
        composerField.text=""
        refreshUI()
        
    }
    @IBAction func removeClicked(sender: AnyObject){
        //connects action of clicking remove button to the remove function in Song/SongList model
        //created by Kal Popzlatev
        mySongList.removeSong(songNameField.text)
        
        songNameField.text=""
        artistField.text=""
        albumField.text=""
        composerField.text=""
        refreshUI()
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        songNameField.resignFirstResponder()
        artistField.resignFirstResponder()
        albumField.resignFirstResponder()
        composerField.resignFirstResponder()
    }
    @IBAction func displaySongs(sender: AnyObject){
        //connects action of clicking display ALl button with the print function of Song/SongList model
        //Created by Sam Kamenetz
        var results = ""
        let songArray = mySongList.print()
        for songs in songArray{
            results += "\(songs.name)\t\(songs.artist)\t\(songs.length)\n"
        }
        resultsField.text = results
    }
    @IBAction func displayArtistSongs(sender: AnyObject) {
        //connects action :(clicking search button & input in artist name text field) to print(artistname) function of Song/SongList class
        //created by Charles Woodward
        var results = ""
        let songArray = mySongList.print(artistPrintField.text)
        for songs in songArray{
            results += "\(songs.name)\t\(songs.artist)\t\(songs.length)\n"
        }
        resultsField.text = results
    }
}


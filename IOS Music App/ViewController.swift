/*
* ViewController.swift
* Practicum 1: IOS Music App
* Description: Creates controller that supports adding Songs, removing Songs, displaying all songs or songs by artist
* Created by: Sam Kamenetz, Kal Popzlatev
* Collaborators: Charles Woodward and Jordan Smith
* Creation date:  2/8/15
* Date last modified:  2/18/2015
* Copyright (c) 2015 Sugr. All rights reserved.
*/

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
    
    /**
    * Function: refreshUI
    * Purpose: writes value of yearStepper and lengthSlider to appropiate text fields on UI
    * Inputs: none
    * Output:
    none- changes text of yearLabel and lengthLabel
    * Notes:
    none
    */
    
    func refreshUI(){
        
        
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
    
    @IBAction func yearChanged(sender: AnyObject){refreshUI()}
    @IBAction func lengthChanged(sender: AnyObject){refreshUI()}
    
    
    /**
    * Function: addClicked
    * Purpose: connects action of clicking add button to the add function in Song/SongList model
    * Inputs:
    songNameField.text - name argument
    artistField.text - artist argument
    albumField.text - album argument
    yearStepper.value - year argument
    composerField.text - composer argument
    lengthSlider.value - length argument
    * Output:
    none- changes text of yearLabel and lengthLabel
    * Notes:
    Adds song to MySongList by calling addSong
    Clears all text fields, and calls refreshUI
    created by Jordan Smith
    */
    @IBAction func addClicked(sender: AnyObject){
        
        mySongList.addSong(songNameField.text, artist: artistField.text, album: albumField.text, year: Int(yearStepper.value), composer: composerField.text, length: Int(lengthSlider.value))
        
        songNameField.text=""
        artistField.text=""
        albumField.text=""
        composerField.text=""
        refreshUI()
        
    }
    /**
    * Function: removedClicked
    * Purpose: connects action of clicking remove button to the remove function in Song/SongList model
    * Inputs:
    songNameField.text -
    * Output:
    none- changes text of yearLabel and lengthLabel
    * Notes:
    removes song from MySongList
    Clears all text fields, and calls refreshUI
    created by Kal Popzlatev
    */
    
    @IBAction func removeClicked(sender: AnyObject){
        
        mySongList.removeSong(songNameField.text)
        
        songNameField.text=""
        artistField.text=""
        albumField.text=""
        composerField.text=""
        refreshUI()
    }
    /**
    * Function: viewTapped
    * Purpose: hides keyboard
    * Inputs:
    none
    * Output:
    none-hides keyboard
    * Notes:
    */
    @IBAction func viewTapped(sender : AnyObject) {
        songNameField.resignFirstResponder()
        artistField.resignFirstResponder()
        albumField.resignFirstResponder()
        composerField.resignFirstResponder()
    }
    /**
    * Function: displaySongs
    * Purpose: connects action of clicking display ALl button with the print function of Song/SongList model
    * Inputs:
    buttonPress
    * Output:
    none- changes text in resultsField to show songs
    * Notes:
    Created by Sam Kamenetz
    */
    
    @IBAction func displaySongs(sender: AnyObject){
        
        var results = ""
        let songArray = mySongList.print()
        for songs in songArray{
            results += "\(songs.name)\t\(songs.artist)\t\(songs.length)\n"
        }
        resultsField.text = results
    }
    /**
    * Function: displayArtistSongs
    * Purpose: connects action :(clicking search button & input in artist name text field) to print(artistname) function of Song/SongList class
    * Inputs:
    artistField.text - artist name
    buttonPress- (search button)
    * Output:
    none- changes text in resultsField to show songs
    * Notes:
    created by Charles Woodward
    */
    
    @IBAction func displayArtistSongs(sender: AnyObject) {
        
        var results = ""
        let songArray = mySongList.print(artistPrintField.text)
        for songs in songArray{
            results += "\(songs.name)\t\(songs.artist)\t\(songs.length)\n"
        }
        resultsField.text = results
    }
}
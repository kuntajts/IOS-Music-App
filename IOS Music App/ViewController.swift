//
//  ViewController.swift
//  IOS Music App
//
//  Created by Jordan Smith on 2/8/15.
//  Copyright (c) 2015 Sugr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var songNameField: UITextField!
    @IBOutlet var artistField: UITextField!
    @IBOutlet var albumField: UITextField!
    @IBOutlet var composerField: UITextField!
    @IBOutlet var lengthSlider: UISlider!
    @IBOutlet var yearStepper: UIStepper!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var lengthLabel: UILabel!
    @IBOutlet var resultsField: UITextView!
    @IBOutlet var artistPrintField: UITextField!
    
    let mySongList = SongList()
    
    func refreshUI(){
        yearLabel.text=String(format: "Year (%d)",Int(yearStepper.value))
        lengthLabel.text=String(format: "Length (%d) s",Int(lengthSlider.value))
        //displayField.text=""
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
        mySongList.addSong(songNameField.text, artist: artistField.text, album: albumField.text, year: Int(yearStepper.value), composer: composerField.text, length: Int(lengthSlider.value))
        
        songNameField.text=""
        artistField.text=""
        albumField.text=""
        composerField.text=""
        refreshUI()
        
    }
    @IBAction func removeClicked(sender: AnyObject){
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
        var results = ""
        let songArray = mySongList.print()
        for songs in songArray{
            results += "\(songs.name)\t\(songs.artist)\t\(songs.length)\n"
        }
        resultsField.text = results
    }
    @IBAction func displayArtistSongs(sender: AnyObject) {
        var results = ""
        let songArray = mySongList.print(artistPrintField.text)
        for songs in songArray{
            results += "\(songs.name)\t\(songs.artist)\t\(songs.length)\n"
        }
        resultsField.text = results
    }
}


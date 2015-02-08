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
    @IBOutlet var scroll: UIScrollView!
    @IBOutlet var displayField: UITextField!
    
    func refreshUI(){
        songNameField.text=""
        artistField.text=""
        albumField.text=""
        composerField.text=""
        lengthSlider.value=500
        yearStepper.value=2000
        yearLabel.text=String(format: "Year %d",Int(yearStepper.value))
        lengthLabel.text=String(format: "Length %d s",Int(lengthSlider.value))
        displayField.text=""
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func yearChanged(){
        
    }
    @IBAction func lengthChanged(sender: AnyObject){
        
        
    }
    @IBAction func addClicked(){
        
    }
    @IBAction func removeClicked(){
        
    }
    @IBAction func displayChanged(){
        
    }
}


//
//  ViewController.swift
//  SliderView
//
//  Created by Артемий Дериглазов on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var colorisedVied: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var greenSliderValue: UIView!
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorisedVied.backgroundColor = UIColor.red
        slidersSetup()
    }
    
    // MARK: - IBAction
    @IBAction func redSpectorChanges() {
        colorisedVied.layer.opacity = redSlider.value
        
    }
    
    @IBAction func greenSpectorChanges() {
    }
    
    @IBAction func blueSpectorChanges() {
    }
    
    
    // MARK: - Private methods
    private func slidersSetup() {
        redSlider.minimumTrackTintColor = UIColor.red
        greenSlider.minimumTrackTintColor = UIColor.green
        blueSlider.minimumTrackTintColor = UIColor.blue
    }
}


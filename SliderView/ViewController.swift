//
//  ViewController.swift
//  SliderView
//
//  Created by Артемий Дериглазов on 05.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var colorisedView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorisedView.backgroundColor = UIColor.red
        colorisedView.layer.cornerRadius = colorisedView.frame.width / 15.5
        slidersSetup()
    }
    

    
    // MARK: - IBAction
    @IBAction func redSpectorChanges() {
        redSliderValue.text = "\(round((redSlider.value) * 100) / 100)"
        colorisedView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func greenSpectorChanges() {
        greenSliderValue.text = "\(round((greenSlider.value) * 100) / 100)"
        colorisedView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func blueSpectorChanges() {
        blueSliderValue.text = "\(round((blueSlider.value) * 100) / 100)"
        colorisedView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    
    // MARK: - Private methods
    private func slidersSetup() {
        redSlider.minimumTrackTintColor = UIColor.red
        greenSlider.minimumTrackTintColor = UIColor.green
        blueSlider.minimumTrackTintColor = UIColor.blue
    }
    
}


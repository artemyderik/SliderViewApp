//
//  ViewController.swift
//  SliderView
//
//  Created by Артемий Дериглазов on 05.03.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var newValue = Value(red: 0, green: 0, blue: 0)
    var delegate: SettingsViewControllerDelegate!
    // MARK: - IBOutlet
    @IBOutlet var colorisedView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redSliderValue: UILabel!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    
    @IBOutlet var redSliderTextField: UITextField!
    @IBOutlet var greenSliderTextField: UITextField!
    @IBOutlet var blueSliderTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorisedView.layer.cornerRadius = colorisedView.frame.width / 15.5
        slidersSetup()
        setTextFields()
        toColorTheView()
    }
    
    
    
    // MARK: - IBAction
    @IBAction func redSpectorChanges() {
        putTexts(from: redSlider, to: redSliderValue, and: redSliderTextField)
        newValue.red = CGFloat(redSlider.value)
        toColorTheView()
    }
    
    @IBAction func greenSpectorChanges() {
        putTexts(from: greenSlider, to: greenSliderValue, and: greenSliderTextField)
        newValue.green = CGFloat(greenSlider.value)
        toColorTheView()
    }
    
    @IBAction func blueSpectorChanges() {
        putTexts(from: blueSlider, to: blueSliderValue, and: blueSliderTextField)
        newValue.blue = CGFloat(blueSlider.value)
        toColorTheView()
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setNewValues(for: newValue)
        dismiss(animated: true)
    }
    
    //MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    
    // MARK: - Private methods
    private func slidersSetup() {
        redSlider.minimumTrackTintColor = UIColor.red
        greenSlider.minimumTrackTintColor = UIColor.green
        blueSlider.minimumTrackTintColor = UIColor.blue
    }
    
    private func toColorTheView() {
        newValue.red = CGFloat(redSlider.value)
        newValue.green = CGFloat(greenSlider.value)
        newValue.blue = CGFloat(blueSlider.value)
        
        colorisedView.backgroundColor = UIColor(
            red: newValue.red,
            green: newValue.green,
            blue: newValue.blue,
            alpha: 1
        )
    }
    
    private func putTexts(
        from sliderValue: UISlider,
        to sliderLabel: UILabel,
        and sliderTextField: UITextField
    ) {
        sliderLabel.text = String(format: "%.2f", sliderValue.value)
        sliderTextField.text = String(format: "%.2f", sliderValue.value)
    }
    
    private func setTextFields() {
        redSliderTextField.delegate = self
        greenSliderTextField.delegate = self
        blueSliderTextField.delegate = self
        
        redSliderTextField.keyboardType = .decimalPad
        greenSliderTextField.keyboardType = .decimalPad
        blueSliderTextField.keyboardType = .decimalPad
    }
}

//MARK: UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let newRedValue = Float(redSliderTextField.text ?? "") ?? 1
        let newGreenValue = Float(greenSliderTextField.text ?? "") ?? 1
        let newBlueValue = Float(blueSliderTextField.text ?? "") ?? 1
        
        redSlider.value = newRedValue
        greenSlider.value = newGreenValue
        blueSlider.value = newBlueValue
        
        redSliderTextField.text = String(newRedValue)
        greenSliderTextField.text = String(newGreenValue)
        blueSliderTextField.text = String(newBlueValue)
        
        toColorTheView()
    }
}

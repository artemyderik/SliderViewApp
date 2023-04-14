//
//  ColorisedViewController.swift
//  SliderView
//
//  Created by Артемий Дериглазов on 04.04.2023.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewValues(for value: Value)
}

class ColorisedViewController: UIViewController {

    private var newValue = Value(red: 1, green: 1, blue: 1)
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.newValue = newValue
        settingsVC.delegate = self
    }
}

//MARK: SettingsViewControllerDelegate
extension ColorisedViewController: SettingsViewControllerDelegate {
    func setNewValues(for value: Value) {
        newValue.red = value.red
        newValue.green = value.green
        newValue.blue = value.blue
        view.backgroundColor = UIColor(
            red: value.red,
            green: value.green,
            blue: value.blue,
            alpha: 1
        )
    }
}

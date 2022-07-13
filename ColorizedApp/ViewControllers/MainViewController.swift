//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by ikorobov on 13.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setColor(for color: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ToSettingVC" else { return }
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorValue = view.backgroundColor
        settingsVC.delegate = self

    }

}

extension MainViewController: SettingsViewControllerDelegate {
    
    func setColor(for color: UIColor) {
        view.backgroundColor = color
    }
}

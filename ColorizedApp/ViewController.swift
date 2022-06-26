//
//  ViewController.swift
//  ColorizedApp
//
//  Created by ikorobov on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 10
        
        setupSliders()
        slidersAction()
        
    }
    
    
    
    @IBAction func slidersAction () {
        
        roundLabels()
        viewColorChanger()
        
        
    }
    
    
    // MARK: private methods
    
    private func setupSliders () {
        
        
        redSlider.minimumTrackTintColor = UIColor(named: "lightRed")
        redSlider.maximumTrackTintColor = UIColor(named: "darkRed")
        redSlider.thumbTintColor = UIColor(named: "lightRed")
        redSlider.value = Float(colorView.backgroundColor?.getColorValue().red ?? 0.25)
        
        greenSlider.minimumTrackTintColor = UIColor(named: "lightGreen")
        greenSlider.maximumTrackTintColor = UIColor(named: "darkGreen")
        greenSlider.thumbTintColor = UIColor(named: "lightGreen")
        greenSlider.value = Float(colorView.backgroundColor?.getColorValue().green ?? 0.25)
        
        blueSlider.minimumTrackTintColor = UIColor(named: "lightBlue")
        blueSlider.maximumTrackTintColor = UIColor(named: "darkBlue")
        blueSlider.thumbTintColor = UIColor(named: "lightBlue")
        blueSlider.value = Float(colorView.backgroundColor?.getColorValue().blue ?? 0.25)
        
    }
    
    private func roundLabels () {
        
        getRoundedValue(label: redValue, slider: redSlider)
        getRoundedValue(label: greenValue, slider: greenSlider)
        getRoundedValue(label: blueValue, slider: blueSlider)
    }
    
    private func getRoundedValue (label: UILabel, slider: UISlider ) {
        
        label.text = String(format: "%.2f", slider.value)
    }
    
    private func viewColorChanger() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
}


extension UIColor {
    
    func getColorValue() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red: red, green: green, blue: blue, alpha: alpha)
    }
}





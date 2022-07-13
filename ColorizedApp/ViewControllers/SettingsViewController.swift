//
//  ViewController.swift
//  ColorizedApp
//
//  Created by ikorobov on 24.06.2022.
//

import UIKit


class SettingsViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redField: UITextField!
    @IBOutlet var greenField: UITextField!
    @IBOutlet var blueField: UITextField!
    
    var colorValue: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        redField.delegate = self
        greenField.delegate = self
        blueField.delegate = self
        getBackgroudColor()
        //setValues()
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setColor(for: colorView.backgroundColor ?? .systemYellow)
        dismiss(animated: true)
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        textFieldDidEndEditing(redField, greenField, blueField )
    }
    @IBAction func slidersAction(_ sender: UISlider) {
        //setValues()
        changeColor()
        switch sender {
            case redSlider:
                redLabel.text = round(from: redSlider)
                redField.text = round(from: redSlider)
            case greenSlider:
                greenLabel.text = round(from: greenSlider)
                greenField.text = round(from: greenSlider)
            default:
                blueLabel.text = round(from: blueSlider)
                blueField.text = round(from: blueSlider)
        }
        
    }
    
    
    // MARK: private methods
    
    
    private func setValues(){
        redLabel.text = round(from: redSlider)
        redField.text = redLabel.text
        greenLabel.text = round(from: greenSlider)
        greenField.text = greenLabel.text
        blueLabel.text = round(from: blueSlider)
        blueField.text = blueLabel.text
    }
    
    private func getBackgroudColor() {
        redSlider.value = Float(colorValue.getColorValue().red)
        greenSlider.value = Float(colorValue.getColorValue().green)
        blueSlider.value = Float(colorValue.getColorValue().blue)
        
    }
    private func round(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func changeColor() {
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

extension SettingsViewController: UITextFieldDelegate {
    //Иду по приборам 🥹
//    internal func textField(_ textField: UITextField..., shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        for textField in textField {
//
//    }
    private func addDoneButton(textField: UITextField...) {
        for textField in textField {
            let keypadToolbar: UIToolbar = UIToolbar()
            keypadToolbar.items = [
                UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: textField, action: nil),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
            ]
            keypadToolbar.sizeToFit()
            textField.inputAccessoryView = keypadToolbar
        }
        
    }
    private func textFieldDidEndEditing(_ textField: UITextField...) {
        for textField in textField {
            guard let newValue = textField.text else { return }
            guard let numberValue = Float(newValue) else { return }
            switch textField.tag {
                case 0:
                    redSlider.value = numberValue
                    redLabel.text = String(numberValue)
                    changeColor()
                case 1:
                    greenSlider.value = numberValue
                    greenLabel.text = String(numberValue)
                    changeColor()
                default:
                    blueSlider.value = numberValue
                    blueLabel.text = String(numberValue)
                    changeColor()
            }
        }
    }
}





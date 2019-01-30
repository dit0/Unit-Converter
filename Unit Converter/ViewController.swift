//
//  ViewController.swift
//  Unit Converter
//
//  Created by Diego Rodrigues de Oliveira on 1/21/19.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperaturePicker: UIPickerView!
    @IBOutlet var temperatureRange: TemperatureRange!
    
    @IBOutlet weak var tempSwitch: UISegmentedControl!
    
    let unitConverter = UnitConverter()
    let userDefaultsLastRowKey = "defaultCelciusPickerRow"


    override func viewDidLoad() {
        super.viewDidLoad()
        
        temperaturePicker.delegate = self
        let defaultPickerRow = initialPickerRow()
        
        temperaturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        pickerView(temperaturePicker, didSelectRow: defaultPickerRow, inComponent: 0)
        
        //how to reload the picker
//        temperaturePicker.reloadComponent(0)
    }
    
    func initialPickerRow() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int{
            return savedRow
        }
        return temperaturePicker.numberOfRows(inComponent: 0) / 2
    }
    
    func saveSelectedRow(row: Int){
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    

    

    func displayConvertedTemperatureForRow(row: Int){
        if tempSwitch.selectedSegmentIndex == 0 {
            let celciusValue = temperatureRange.values[row]
            temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: celciusValue))°F"
            temperaturePicker.reloadComponent(0)

        } else if tempSwitch.selectedSegmentIndex == 1 {
            let farenheitValue = temperatureRange.values[row]
            temperatureLabel.text = "\(unitConverter.farenheitDegrees(degreedFarenheit: farenheitValue))°C"
            temperaturePicker.reloadComponent(0)
        }
       
    }
    
}

extension ViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if tempSwitch.selectedSegmentIndex == 0 {
            return "\(temperatureRange.values[row])°C"
            
        } else {
            return "\(temperatureRange.values[row])°F"
        }
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
        
        
        
    }
    
    
}


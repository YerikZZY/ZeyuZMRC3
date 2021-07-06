//
//  ViewController.swift
//  ZeyuZMRC
//
//  Created by Jay Zhang on 1/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    var chanelNum: [Int] = []

    @IBOutlet weak var TVPowerLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var chanelLabel: UILabel!
    @IBOutlet weak var powerUISwitch: UISwitch!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var chPlus: UIButton!
    @IBOutlet weak var chMinus: UIButton!
    @IBOutlet weak var FCSegment: UISegmentedControl!
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        TVPowerLabel.text = (sender.isOn ? "on" : "off")
        powerUISwitch.setOn(sender.isOn, animated: true)
        if sender.isOn == true{
            TVPowerLabel.text = "On"
            volumeSlider.isEnabled = true
            button0.isEnabled = true
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled = true
            button6.isEnabled = true
            button7.isEnabled = true
            button8.isEnabled = true
            button9.isEnabled = true
            chPlus.isEnabled = true
            chMinus.isEnabled = true
            FCSegment.isEnabled = true
        }
        else{
            TVPowerLabel.text = "Off"
            volumeSlider.isEnabled = false
            button0.isEnabled = false
            button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
            button5.isEnabled = false
            button6.isEnabled = false
            button7.isEnabled = false
            button8.isEnabled = false
            button9.isEnabled = false
            chPlus.isEnabled = false
            chMinus.isEnabled = false
            FCSegment.isEnabled = false
        }
    }
    
    @IBAction func volumeChange(_ sender: UISlider) {
        volumeLabel.text = "\(Int(sender.value*100))"
    }
    
    @IBAction func numPressed(_ sender: UIButton) {
        let num: Int = Int(sender.currentTitle!)!
        if chanelNum.count == 0 || chanelNum.count == 1{
            chanelNum.append(num)
        }
        if chanelNum.count == 2{
            let newChanel = chanelNum[0]*10 + chanelNum[1]
            chanelNum.removeAll()
            if newChanel == 0{
                chanelNum.removeAll()
            }
            else{
                chanelLabel.text = "\(newChanel)"
                chanelNum.removeAll()
            }
        }
    }
    
    @IBAction func plusPressed(_ sender: UIButton) {
        var result: Int
        let num = Int(chanelLabel.text!)!
        if num > 99 || num == 99{
            result = num
        }
        else{
            result = num + 1
        }
        chanelLabel.text = "\(result)"
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        var result: Int
        let num = Int(chanelLabel.text!)!
        if num < 1 || num == 1{
            result = num
        }
        else{
            result = num - 1
        }
        chanelLabel.text = "\(result)"
    }
    
    @IBAction func chanelChanged(_ sender: UISegmentedControl) {
        
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == favoriteName[0]{
            chanelLabel.text = "\(favoriteNum[0])"
        }
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == favoriteName[1]{
            chanelLabel.text = "\(favoriteNum[1])"
        }
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == favoriteName[2]{
            chanelLabel.text = "\(favoriteNum[2])"
        }
        if sender.titleForSegment(at: sender.selectedSegmentIndex) == favoriteName[3]{
            chanelLabel.text = "\(favoriteNum[3])"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        FCSegment.setTitle(favoriteName[favoriteSegment], forSegmentAt: favoriteSegment)
    }

}


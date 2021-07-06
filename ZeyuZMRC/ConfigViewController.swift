//
//  ConfigViewController.swift
//  ZeyuZMRC
//
//  Created by Jay Zhang on 2/20/21.
//

import UIKit

class ConfigViewController: UIViewController {

    @IBOutlet weak var numStepper: UIStepper!
    @IBOutlet weak var channelNum: UILabel!
    @IBOutlet weak var fourChannel: UISegmentedControl!
    @IBOutlet weak var titleLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func inputName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTouched(_ sender: UIControl) {
        titleLabel.resignFirstResponder()
    }

    @IBAction func stepperTouched(_ sender: UIStepper) {
        favoriteChannel = Int(sender.value)
        channelNum.text = "\(favoriteChannel)"
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        if titleLabel.text!.count <= 4 && titleLabel.text!.count > 0 {
            favoriteChannel = Int (channelNum.text!)!
            favoriteSegment = fourChannel.selectedSegmentIndex
            favoriteName[favoriteSegment] = titleLabel.text!
            favoriteNum[favoriteSegment] = favoriteChannel
            
            let title = "Update Sucess"
            let message = "Favorite channel updated"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
        }
        else{
            titleLabel.text = ""
            channelNum.text = "1"
            
            let title = "Error"
            let message = "Invalid favorite name input. You should input at least 1 char at most 4 chars"
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        fourChannel.selectedSegmentIndex = 0
        favoriteChannel = 1
        channelNum.text = "\(favoriteChannel)"
        titleLabel.text = ""
        numStepper.value = 1
        
        let title = "Canceled"
        let message = "You already cancel your input, nothing saved."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true, completion: nil)
    }
    

}

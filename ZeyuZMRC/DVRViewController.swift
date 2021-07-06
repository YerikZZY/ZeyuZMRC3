//
//  DVRViewController.swift
//  ZeyuZMRC
//
//  Created by Jay Zhang on 2/15/21.
//

import UIKit

class DVRViewController: UIViewController {

    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var fowardButton: UIButton!
    @IBOutlet weak var rewindButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var powerUIswitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func powerSwitch(_ sender: UISwitch) {
        powerLabel.text = (sender.isOn ? "on" : "off")
        powerUIswitch.setOn(sender.isOn, animated: true)
        if sender.isOn == true{
            stateLabel.text = "Stopped"
            powerLabel.text = "On"
            playButton.isEnabled = true
            stopButton.isEnabled = true
            pauseButton.isEnabled = true
            fowardButton.isEnabled = true
            rewindButton.isEnabled = true
            recordButton.isEnabled = true
        }
        if sender.isOn == false{
            powerLabel.text = "Off"
            playButton.isEnabled = false
            stopButton.isEnabled = false
            pauseButton.isEnabled = false
            fowardButton.isEnabled = false
            rewindButton.isEnabled = false
            recordButton.isEnabled = false
        }
    }
    @IBAction func playPressed(_ sender: UIButton) {
        if stateLabel.text == "Recording"{
            warning(stateContent: "Playing")
        }
        else{
            stateLabel.text = "Playing"
        }
    }
    
    @IBAction func stopPressed(_ sender: UIButton) {
        stateLabel.text = "Stopped"
    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        if stateLabel.text == "Playing" || stateLabel.text == "Paused"{
            stateLabel.text = "Paused"
        }
        else{
            warning(stateContent: "Paused")
        }
    }
    
    @IBAction func fowardPressed(_ sender: UIButton) {
        if stateLabel.text == "Playing" || stateLabel.text == "Fast Foward"{
            stateLabel.text = "Fast Foward"
        }
        else{
            warning(stateContent: "Fast Foward")
        }
    }
    
    @IBAction func rewindPressed(_ sender: UIButton) {
        if stateLabel.text == "Playing" || stateLabel.text == "Fast Rewind"{
            stateLabel.text = "Fast Rewind"
        }
        else{
            warning(stateContent: "Fast Rewind")
        }
    }
    
    @IBAction func recordPressed(_ sender: UIButton) {
        if stateLabel.text == "Stopped" || stateLabel.text == "Recording"{
            stateLabel.text = "Recording"
        }
        else{
            warning(stateContent: "Recording")
        }
    }
    
    func warning(stateContent : String){
        let alertController = UIAlertController(title:"Warning", message:"Pressed the wrong button, cancel or force run.", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let forceAction = UIAlertAction(title: "Force Run", style: .default, handler: { action in
            let forceController = UIAlertController(title: "Force Operation", message: "Current operation has been stopped, now is \(stateContent) operation.", preferredStyle: .alert)
            let forceAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            forceController.addAction(forceAction)
            self.present(forceController, animated: true, completion: nil)
            self.stateLabel.text = "\(stateContent)"
            
        })
        alertController.addAction(cancelAction)
        alertController.addAction(forceAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

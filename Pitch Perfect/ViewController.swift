//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Tarik Stafford on 1/17/17.
//  Copyright © 2017 Udacity Tarik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var RecordingButton: UIButton!
    @IBOutlet weak var StopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StopRecordingButton.isEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RecordingButton.isEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func RecordButton(_ sender: Any) {
        RecordingLabel.text = "Recording"
        StopRecordingButton.isEnabled = true
        RecordingButton.isEnabled = false
    }
    @IBAction func StopRecording(_ sender: Any) {
        RecordingButton.isEnabled = true
        StopRecordingButton.isEnabled = false
        RecordingLabel.text = "Tap to Record"
    }

}


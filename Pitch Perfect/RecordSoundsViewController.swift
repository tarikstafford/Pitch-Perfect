//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Tarik Stafford on 1/17/17.
//  Copyright © 2017 Udacity Tarik. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var RecordingButton: UIButton!
    @IBOutlet weak var StopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StopRecordingButton.isEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        RecordingButton.isEnabled = true
    }

    @IBAction func RecordButton(_ sender: Any) {
        RecordingLabel.text = "Recording..."
        StopRecordingButton.isEnabled = true
        RecordingButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:] )
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
}

    @IBAction func StopRecording(_ sender: Any) {
        StopRecordingButton.isEnabled = false
        RecordingLabel.text = "Tap to Record."
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
}
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
        performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("Recording was not successful.")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playsoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playsoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}




//
//  recorderViewController.swift
//  SoundBoard
//
//  Created by Ali Said on 23/03/2017.
//  Copyright © 2017 compume. All rights reserved.
//

import UIKit
import AVFoundation

class recorderViewController: UIViewController {
    
    
    @IBOutlet var recordButton: UIView!
    @IBOutlet weak var textField: UITextField!
    
    var audioRecorder : AVAudioRecorder?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRecorder()
    }
    
    
    func setupRecorder() {
        
        do{
            
            // create session
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try session.overrideOutputAudioPort(.speaker)
            try session.setActive(true)
            
            // create URL for the file
            
            let basePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let pathComponets = [basePath,"audio.m4a"]
            let audioURL = NSURL.fileURL(withPathComponents: pathComponets)!
            
            // create settings for the audio recorder
            
            var settings : [String:AnyObject] = [:]
            settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject? as AnyObject
            settings[AVSampleRateKey] = 44100.0 as AnyObject
            settings[AVNumberOfChannelsKey] = 2 as AnyObject
            
            
            // create Audio Recorer Object
            
            audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            audioRecorder!.prepareToRecord()
            
        }catch let error as NSError {
            print (error)
            
        }catch {}
        
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    
    @IBAction func playTapped(_ sender: Any) {
    }
    
    @IBAction func recordTapped(_ sender: Any) {
    }
}

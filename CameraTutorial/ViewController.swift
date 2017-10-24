//
//  ViewController.swift
//  CameraTutorial
//
//  Created by Lizardo, Nathaniel on 10/24/17.
//  Copyright © 2017 Lizardo, Nathaniel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?

    @IBOutlet weak var previewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            previewView.layer.addSublayer(videoPreviewLayer!)
            
            captureSession?.startRunning()
            
            
        } catch {
            print(error)
        }
        
    }

    

}


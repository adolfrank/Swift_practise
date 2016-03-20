//
//  LeftViewController.swift
//  05-day
//
//  Created by Adolfrank on 3/19/16.
//  Copyright © 2016 FrankAdol. All rights reserved.
//

import UIKit
import AVFoundation

class LeftViewController: UIViewController {

    @IBOutlet weak var cameraView: UIImageView!
    
    @IBOutlet weak var tempView: UIImageView!
    
    @IBOutlet weak var captureBtn: UIButton!
    
    @IBAction func captureBtnDidTouch(sender: AnyObject) {
        didPressTakeAnother()
    }
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    override func prefersStatusBarHidden() -> Bool {
        
        return true
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
       
        return UIStatusBarAnimation.Slide
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
         print("left - preferredStatusBarStyle")
        return UIStatusBarStyle.LightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didMoveToParentViewController(parent: UIViewController?) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }
   
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSessionPreset1920x1080
        
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error : NSError?
        var input: AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera) }
        catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if (captureSession?.canAddOutput(stillImageOutput) != nil) {
                captureSession?.addOutput(stillImageOutput)
                
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                previewLayer?.connection.videoOrientation = AVCaptureVideoOrientation.Portrait
                cameraView.layer.addSublayer(previewLayer!)
                captureSession?.startRunning()
            }
            
        }
        
    }
    
    func didPressTakePhoto(){
        
        if let videoConnection = stillImageOutput?.connectionWithMediaType(AVMediaTypeVideo){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {
                (sampleBuffer, error) in
                
                if sampleBuffer != nil {
                    
                    
                    var imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    var dataProvider  = CGDataProviderCreateWithCFData(imageData)
                    var cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    var image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                    
                    self.tempView.image = image
                    self.tempView.hidden = false
                    
                }
                
                
            })
        }
    }
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother(){
//        if didTakePhoto == true{
//            tempView.hidden = true
//            didTakePhoto = false
//            
//        }
//        else{
//            captureSession?.startRunning()
//            didTakePhoto = true
//            didPressTakePhoto()
//            
//        }
        didTakePhoto = true
        didPressTakePhoto()
        
    }
    
    

}

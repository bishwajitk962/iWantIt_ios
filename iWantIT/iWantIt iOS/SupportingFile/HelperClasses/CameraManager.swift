//
//  CameraManager.swift
//  E-Wallet
//
//  Created by Prashant Kumar on 02/01/24.
//

import UIKit
import AVFoundation

class CameraManager: NSObject {
    
    private var captureSession: AVCaptureSession?
    private var previewLayer: AVCaptureVideoPreviewLayer?
    
    func setupCamera(in view: UIView) {
        captureSession = AVCaptureSession()
        
        guard let backCamera = AVCaptureDevice.default(for: .video) else { return }
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            if captureSession!.canAddInput(input) {
                captureSession!.addInput(input)
            } else {
                print("Error: Couldn't add camera input")
                return
            }
        } catch {
            print("Error: Couldn't create camera input")
            return
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        view.layer.addSublayer(previewLayer!)
        previewLayer!.videoGravity = .resizeAspectFill
        previewLayer!.cornerRadius = view.bounds.width / 2  // Set the cornerRadius to make it circular
        previewLayer!.masksToBounds = true
        
        captureSession!.startRunning()
    }
    
    func startSession() {
        captureSession?.startRunning()
    }
    
    func stopSession() {
        captureSession?.stopRunning()
    }
    
    func setCameraOrientation(_ orientation: AVCaptureVideoOrientation) {
        previewLayer?.connection?.videoOrientation = orientation
    }
    
    func updatePreviewFrame(in view: UIView) {
        previewLayer?.frame = view.layer.bounds
    }
}

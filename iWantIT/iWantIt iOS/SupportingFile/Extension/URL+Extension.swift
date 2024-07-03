//
//  URL+Extension.swift
//  TimeApp
//
//  Created by Bishwajit kumar on 12/12/23.
//  Copyright © 2020 Tina. All rights reserved.
//

import AVFoundation
import UIKit

extension URL {
    func imageThumbnail(fromTime time: Float64 = 0) -> UIImage? {
        let imageGenerator = AVAssetImageGenerator(asset: AVAsset(url: self))
        imageGenerator.appliesPreferredTrackTransform = true
        let time = CMTimeMakeWithSeconds(time, preferredTimescale: 1)
        var actualTime = CMTimeMake(value: 0, timescale: 0)

        guard let cgImage = try? imageGenerator.copyCGImage(at: time, actualTime: &actualTime) else {
            return nil
        }
        return UIImage(cgImage: cgImage)
    }
}


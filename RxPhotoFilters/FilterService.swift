//
//  FilterService.swift
//  RxPhotoFilters
//
//  Created by Alexander Milgunov on 13.01.2021.
//

import UIKit
import CoreImage

class FilterService {
    
    private var context: CIContext
    
    func applyfilter(to inputImage: UIImage, completion: @escaping ((UIImage) -> ())) {
        
        guard let filter = CIFilter(name: "CICMYKHalftone") else { return }
        filter.setValue(5.0, forKey: kCIInputWidthKey)
        
        if let sourceImage = CIImage(image: inputImage) {
            
            filter.setValue(sourceImage, forKey: kCIInputImageKey)
            
            if let fImage = filter.outputImage, let cgImg = self.context.createCGImage(fImage, from: fImage.extent) {
                
                let processedImage = UIImage(cgImage: cgImg, scale: inputImage.scale, orientation: inputImage.imageOrientation)
                completion(processedImage)
            }
        }
    }
    
    init() {
        self.context = CIContext()
    }
}

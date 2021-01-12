//
//  PhotosCollectionViewController.swift
//  RxPhotoFilters
//
//  Created by Alexander Milgunov on 12.01.2021.
//

import Foundation
import UIKit
import Photos

class PhotosCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    private func populatePhotos() {
        
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                
            }
        }
        
    }
    
}

//
//  ViewController.swift
//  RxPhotoFilters
//
//  Created by Alexander Milgunov on 12.01.2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var applyFilterButton: UIButton!
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navController = segue.destination as? UINavigationController, let photoVC = navController.viewControllers.first as? PhotosCollectionViewController else { fatalError("Destination controller is not found") }
        
        photoVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            
            DispatchQueue.main.async {
                self?.updateUI(with: photo)
            }
            
        }).disposed(by: disposeBag)

    }

    private func updateUI(with image: UIImage) {
        self.imageView.image = image
        self.applyFilterButton.isHidden = false
    }
    
}


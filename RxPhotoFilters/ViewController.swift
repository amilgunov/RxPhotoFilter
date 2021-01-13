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
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navController = segue.destination as? UINavigationController, let photoVC = navController.viewControllers.first as? PhotosCollectionViewController else { fatalError("Destination controller is not found") }
        
        photoVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            self?.imageView.image = photo
        }).disposed(by: disposeBag)

    }


}


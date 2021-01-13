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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dest = segue.destination as? UINavigationController, let vc = dest.viewControllers.first as? PhotosCollectionViewController else { return }
        
        _ = vc.selectedPhoto.subscribe { image in
            self.imageView.image = image
        }.disposed(by: vc.disposeBag)

    }


}


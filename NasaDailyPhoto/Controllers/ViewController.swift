//
//  ViewController.swift
//  NasaDailyPhoto
//
//  Created by Camilo Cabana on 13/08/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let homeView = HomeView()
    let photoInfoService = PhotoInfoService()
    var descriptionLabel = UILabel()
    var photoNasa = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    override func loadView() {
        photoNasa = homeView.nasaImage
        descriptionLabel = homeView.descriptionLabel
        view = homeView
    }
    
    func fetchData() {
        photoInfoService.fetchPhotoInfo { [weak self] (photoInfo) in
            self?.descriptionLabel.text = photoInfo?.description
            self?.title = photoInfo?.title
            self?.photoNasa.loadCacheImage(url: photoInfo?.url ?? "")
        }
    }

}


//
//  PhotoInfoService.swift
//  NasaDailyPhoto
//
//  Created by Camilo Cabana on 13/08/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import Foundation

class PhotoInfoService {
    func fetchPhotoInfo(complition: @escaping(PhotoInfo?) -> Void) {
        let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query = ["api_key": "DEMO_KEY", "date": "2018-08-29"]
        let url = baseUrl.withQueries(query)!

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data {
                let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data)
                DispatchQueue.main.async {
                    complition(photoInfo)
                }
            } else {
                DispatchQueue.main.async {
                    print("No Data")
                    complition(nil)
                }
            }
        }
        task.resume()
    }
}

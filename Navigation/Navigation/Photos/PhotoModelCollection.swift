//
//  PhotoModelCollection.swift
//  Navigation
//
//  Created by Георгий Маркарян on 23.04.2022.
//
import UIKit
struct PhotosModelCollection{

    var image: UIImage

    static func makePhotosCollection() -> [PhotosModelCollection]{
        var model = [PhotosModelCollection]()

        model.append(PhotosModelCollection(image: UIImage(named: "001")!))
        model.append(PhotosModelCollection(image: UIImage(named: "002")!))
        model.append(PhotosModelCollection(image: UIImage(named: "003")!))
        model.append(PhotosModelCollection(image: UIImage(named: "004")!))
        model.append(PhotosModelCollection(image: UIImage(named: "005")!))
        model.append(PhotosModelCollection(image: UIImage(named: "006")!))
        model.append(PhotosModelCollection(image: UIImage(named: "007")!))
        model.append(PhotosModelCollection(image: UIImage(named: "008")!))
        model.append(PhotosModelCollection(image: UIImage(named: "009")!))
        model.append(PhotosModelCollection(image: UIImage(named: "010")!))
        model.append(PhotosModelCollection(image: UIImage(named: "011")!))
        model.append(PhotosModelCollection(image: UIImage(named: "012")!))
        model.append(PhotosModelCollection(image: UIImage(named: "013")!))
        model.append(PhotosModelCollection(image: UIImage(named: "014")!))
        model.append(PhotosModelCollection(image: UIImage(named: "015")!))
        model.append(PhotosModelCollection(image: UIImage(named: "016")!))
        model.append(PhotosModelCollection(image: UIImage(named: "017")!))
        model.append(PhotosModelCollection(image: UIImage(named: "018")!))
        model.append(PhotosModelCollection(image: UIImage(named: "019")!))
        model.append(PhotosModelCollection(image: UIImage(named: "020")!))

        return model
    }
}

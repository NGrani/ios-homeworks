//
//  PhotosModel.swift
//  Navigation
//
//  Created by Георгий Маркарян on 22.04.2022.
//

import UIKit

struct PhotoModel{
    let photosLabel: String

    static func makePost()-> [PhotoModel]{
        var model = [PhotoModel]()

        model.append(PhotoModel(photosLabel: "Photos"))

        return model
}
}

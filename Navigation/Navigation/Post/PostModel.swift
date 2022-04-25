//
//  PostModel.swift
//  Navigation
//
//  Created by Георгий Маркарян on 18.04.2022.
//

import UIKit

struct PostModel{
    var author: String
    var description: String?
    var image: UIImage
    var likes: Int
    var views: Int

    static func makePost()-> [PostModel]{
        var model = [PostModel]()

        model.append(PostModel(author: "NIck", description: "xaxaxa", image: UIImage(named: "2")!, likes: 23, views: 222))
        model.append(PostModel(author: "Domenic", description: "Have you seen it?", image: UIImage(named: "3")!, likes: 33, views: 2232))
        model.append(PostModel(author: "Gik", description: "Wow", image: UIImage(named: "4")!, likes: 43, views: 2444))
        model.append(PostModel(author: "Zic", description: "lol", image: UIImage(named: "5")!, likes: 53, views: 342))

        return model
    }
}



//
//  InfoViewController.swift
//  Navigation
//
//  Created by Георгий Маркарян on 09.04.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        tapButton()
    }
    
    private func tapButton(){
        let showPost = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        showPost.center = view.center
        showPost.setTitle("Вернуться к посту", for: .normal)
        showPost.backgroundColor = .green
        showPost.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(showPost)

    }

    @objc private func tapAction(){
       
        let alert = UIAlertController(title: "Вернуться к посту", message: "Вы точно хотите вернуться к посту?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Вернуться", style: .default) { _ in
            self.dismiss(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }


}

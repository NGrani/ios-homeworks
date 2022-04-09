//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Георгий Маркарян on 04.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let screenWight = UIScreen.main.bounds.width
        if let profile = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            profile.frame = CGRect(x: 16, y: 40, width: screenWight - 30, height: 200)
            view.addSubview(profile)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

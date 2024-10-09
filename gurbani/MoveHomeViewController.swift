//
//  MoveHomeViewController.swift
//  gurbani
//
//  Created by user247371 on 3/2/24.
//

import UIKit

class MoveHomeViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            // Automatically navigate to the HomeViewController
            let homeViewController = HomeViewController()
            navigationController?.pushViewController(homeViewController, animated: true)
            
        
        self.dismiss(animated: true)
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

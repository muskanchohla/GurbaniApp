//
//  TestViewController.swift
//  gurbani
//
//  Created by user247371 on 3/2/24.
//

import UIKit

struct Question {
    let question: String
    let options: [String]
    let correctAnswerIndex: Int
}

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Test View Controller")
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

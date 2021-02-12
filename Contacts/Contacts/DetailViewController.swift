//
//  DetailViewController.swift
//  Contacts
//
//  Created by Madina Amantayeva on 11.02.2021.
//

import UIKit

class DetailViewController: UIViewController {
    var name_surname: String?
    var number: String?
    var image: UIImage?
    
    @IBOutlet weak var nameSurnameLabel: UILabel!
    
    @IBOutlet weak var numbersLabel: UILabel!
    
    @IBOutlet weak var contactImageLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = name_surname
        numbersLabel.text = number
        contactImageLabel.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func DeletePressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
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

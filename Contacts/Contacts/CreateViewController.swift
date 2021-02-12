//
//  CreateViewController.swift
//  Contacts
//
//  Created by Madina Amantayeva on 13.02.2021.
//

import UIKit

class CreateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var contact: Contact?
    var listGender : [String] = [String]()
    var gender: String?
    var image: UIImage?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listGender.count
    }
    
    @IBOutlet weak var name_surname: UITextField!
    
    @IBOutlet weak var number: UITextField!
    
    
    @IBOutlet weak var genderPicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        listGender = ["male", "female"]

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ViewController
        destination.name_surname = name_surname.text
        destination.number = number.text
        destination.gender = "female"
        destination.image = UIImage.init(named: "female")
        
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

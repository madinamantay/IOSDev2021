//
//  ViewController.swift
//  Contacts
//
//  Created by Madina Amantayeva on 11.02.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var name_surname: String?
    var number: String?
    var image: UIImage?
    var gender: String?
    
    var contacts = [Contact.init("Amantayeva Madina", "+7779995511", UIImage.init(named: "female")!),Contact.init("Amantayeva Amina", "+7779994420",UIImage.init(named: "female")!)]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.contactName.text = contacts[indexPath.row].name_surname
        cell?.contactNumber.text = contacts[indexPath.row].number
        cell?.contactImageView.image = contacts[indexPath.row].image
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            contacts.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "mySegue"){
            let index = (myTableView.indexPathForSelectedRow?.row)!
            let destination = segue.destination as! DetailViewController
            destination.name_surname = contacts[index].name_surname
            destination.number = contacts[index].number
            destination.image = contacts[index].image
        }
    }


}


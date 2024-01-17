//
//  ViewController.swift
//  ImportContacts
//
//  Created by Muhammad Wasiq  on 12/01/2024.
//

import UIKit
import Contacts
import ContactsUI

class ViewController: UIViewController, CNContactPickerDelegate {

    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        PhoneContacts.shared.fetchContacts() { contacts in
//            print(contacts)
//        }
    }

    @IBAction func addContact(_ sender: UIButton) {
        let contactController = CNContactPickerViewController()
        contactController.delegate = self
        self.present(contactController, animated: true, completion: nil)
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        firstName.text = contact.givenName
        lastName.text = contact.familyName
        if let imgData = contact.imageData {
            contactImage.image = UIImage(data: imgData)
        }
    }
}


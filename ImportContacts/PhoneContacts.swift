//
//  PhoneContacts.swift
//  ImportContacts
//
//  Created by Muhammad Wasiq  on 12/01/2024.
//

import Foundation
import Contacts
import ContactsUI

class PhoneContacts {
    static let shared = PhoneContacts()
    private init() {}
    
    var contacts = [CNContact]()
    
    func fetchContacts(completion: @escaping ([CNContact]) -> Void) {
        let keys = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactPhoneNumbersKey as CNKeyDescriptor,
            CNContactImageDataKey as CNKeyDescriptor,
            CNContactEmailAddressesKey as CNKeyDescriptor
        ]
        let request = CNContactFetchRequest(keysToFetch: keys)
        
        let contactStore = CNContactStore()
        DispatchQueue.global(qos: .background).async {
            do {
                try contactStore.enumerateContacts(with: request) {
                    (contact, stop) in
                    // Array containing all unified contacts from everywhere
                    self.contacts.append(contact)
                }
                completion(self.contacts)
            }
            catch {
                print("unable to fetch contacts")
                completion([])
            }
        }
    }
}

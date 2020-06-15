import Foundation

var contactsViewModel:[ContactViewModel] = [
    ContactViewModel(contactDataModel: Contact1),
    ContactViewModel(contactDataModel: Contact2),
    ContactViewModel(contactDataModel: Contact3),
    ContactViewModel(contactDataModel: Contact4),
    ContactViewModel(contactDataModel: Contact5),
    ContactViewModel(contactDataModel: Contact6),
    ContactViewModel(contactDataModel: Contact7),
    ContactViewModel(contactDataModel: Contact8),
    ContactViewModel(contactDataModel: Contact9)
]

class ContactViewModel {
    private let contactDataModel: Contact
    
    init(contactDataModel: Contact)
    {
        self.contactDataModel = contactDataModel
    }
    
    public var contact: Contact {
        return self.contactDataModel
    }
}

class LegalEntity:
    def __init__(self, name, type, registration_number, address, contact_info):
        self.name = name
        self.type = type
        self.registration_number = registration_number
        self.address = address
        self.contact_info = contact_info

    def get_name(self):
        return self.name

    def get_type(self):
        return self.type

    def get_registration_number(self):
        return self.registration_number

    def get_address(self):
        return self.address

    def get_contact_info(self):
        return self.contact_info

    def change_address(self, new_address):
        self.address = new_address

    def change_contact_info(self, new_contact_info):
        self.contact_info = new_contact_info

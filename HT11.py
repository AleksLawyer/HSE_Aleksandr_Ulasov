import requests

base_url = "https://legal-api.sirotinsky.com"
token = "4123saedfasedfsadf4324234f223ddf23"
inn = "7702758341"

class LegalAPI:

    def __init__(self, base_url, token):
        self.base_url = base_url
        self.token = token

    def efrsb_publisher_messages(self):
        """Находит объявления, опубликованные юр.лицом с определенным ИНН"""
        
        url = f"{self.base_url}/{self.token}/efrsb/publisher_messages/{inn}"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

    def efrsb_debtor_messages(self):
        """Находит должников с определенным ИНН"""

        url = f"{self.base_url}/{self.token}/efrsb/debtor_messages/{inn}"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

    def efrsb_trader(self):
        """Находит организаторов торгов с определенным ИНН"""

        url = f"{self.base_url}/{self.token}/efrsb/trader/{inn}"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

    def efrsb_organisation(self):
        """Находит юр.лица с определенным ИНН"""

        url = f"{self.base_url}/{self.token}/efrsb/organisation/{inn}"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

    def efrsb_person(self):
        """Находит физ.лица с определенным ИНН"""

        url = f"{self.base_url}/{self.token}/efrsb/person/{inn}"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

    def efrsb_manager(self):
        """Находит арбитражных управляющих с определенным ИНН"""

        url = f"{self.base_url}/{self.token}/efrsb/manager/{inn}"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

    def efrsb_manager_all(self):
        """Находит всех арбитражных управляющих"""

        url = f"{self.base_url}/{self.token}/efrsb/manager/all"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

    def efrsb_trader_all(self):
        """Находит всех организаторов торгов"""

        url = f"{self.base_url}/{self.token}/efrsb/trader/all"
        response = requests.get(url)
        response.raise_for_status()
        return response.json()

def main():
    api = LegalAPI("https://legal-api.sirotinsky.com", "4123saedfasedfsadf4324234f223ddf23")
    pub_messages = api.efrsb_publisher_messages()
    deb_messages = api.efrsb_debtor_messages()
    trader = api.efrsb_trader()
    org = api.efrsb_organisation()
    pers = api.efrsb_person()
    manager = api.efrsb_manager()
    manager_all = api.efrsb_manager_all()
    trader_all = api.efrsb_trader_all()
    return pub_messages, deb_messages, trader, org, pers, manager, manager_all, trader_all


print(main())

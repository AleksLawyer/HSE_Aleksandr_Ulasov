import requests
from bs4 import BeautifulSoup


class ParserCBRF:
    BASE_URL = "https://cbr.ru"

    def __init__(self):
        self.soup = None

    def get_cbr_page_soup(self, from_date: str, to_date: str) -> BeautifulSoup:
        params = f"?UniDbQuery.Posted=True"\
                 f"UniDbQuery.From={from_date}"\
                 f"UniDbQuery.To={to_date}"\
                 f"UniDbQuery.Gold=true"\
                 f"UniDbQuery.so=1"
        url = f"{self.BASE_URL}/hd_base/metall/metall_base_new/{params}"
        r = requests.get(url)
        r.raise_for_status()
        html = r.text
        soup = BeautifulSoup(html, 'html.parser')
        return soup

    @staticmethod
    def parse_cbr_data(soup: BeautifulSoup):
        data = soup.find_all("th", "right")
        return data

    def start(self):
        cbr_soup = self.get_cbr_page_soup("20.05.2024", "25.05.2024")
        parsed_data = self.parse_cbr_data(cbr_soup)

def main():
    parser = ParserCBRF()
    parser.start()


if __name__ == "__main__ ":
    main()

print(main())

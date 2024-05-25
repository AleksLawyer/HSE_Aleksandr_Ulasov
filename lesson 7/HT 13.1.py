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
        soup = BeautifulSoup(r.text, 'html.parser')
        return soup

    @staticmethod
    def parse_cbr_data(soup: BeautifulSoup):
        table_cells = soup.find("table").find_all("td")
        dates = [d.text for i, d in enumerate(table_cells) if i % 2 == 0]
        rates = [d.text for i, d in enumerate(table_cells) if i % 2 != 0]
        data = list(zip(dates, rates))
        return data

    def start(self):
        cbr_soup = self.get_cbr_page_soup("20.05.2024", "25.05.2024")
        parsed_data = self.parse_cbr_data(cbr_soup)
        print(parsed_data)

def main():
    parser = ParserCBRF()
    parser.start()


if __name__ == "__main__ ":
    main()

print(main())

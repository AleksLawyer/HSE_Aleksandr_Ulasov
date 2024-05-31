import requests
from bs4 import BeautifulSoup
import json


class ParserCBRF:
    """Класс возвращает актуальные цены на драгоценные металлы"""

    def __init__(self):
        self.soup = None

    def __get_cbr_page_soup__(self) -> BeautifulSoup:
        url = "https://cbr.ru/hd_base/metall/metall_base_new/"
        r = requests.get(url)
        r.raise_for_status()
        soup = BeautifulSoup(r.text, 'html.parser')
        return soup

    @staticmethod
    def __parse_cbr_data__(soup: BeautifulSoup):
        gold = soup.find("table", "data").find_all("th", "right")[0]
        gold_price = soup.find("table", "data").find_all("td", "right")[0]
        data_gold = dict(zip(gold, gold_price))
        silver = soup.find("table", "data").find_all("th", "right")[1]
        silver_price = soup.find("table", "data").find_all("td", "right")[1]
        data_silver = dict(zip(silver, silver_price))
        platinum = soup.find("table", "data").find_all("th", "right")[2]
        platinum_price = soup.find("table", "data").find_all("td", "right")[2]
        data_platinum = dict(zip(platinum, platinum_price))
        palladium = soup.find("table", "data").find_all("th", "right")[3]
        palladium_price = soup.find("table", "data").find_all("td", "right")[3]
        data_palladium = dict(zip(palladium, palladium_price))
        data = [data_gold, data_silver, data_platinum, data_palladium]
        new_data = {}
        for entry in data:
            new_data.update(entry)
        with open("data.json", "w") as fp:
            json.dump(new_data, fp)
        return new_data

    def start(self):
        cbr_soup = self.__get_cbr_page_soup__()
        parsed_data = self.__parse_cbr_data__(cbr_soup)
        return parsed_data


parser = ParserCBRF()
print(parser.start())

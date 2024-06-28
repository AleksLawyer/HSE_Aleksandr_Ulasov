import requests
from bs4 import BeautifulSoup
import json
from datetime import datetime, date
import os
from decimal import Decimal

class ParserCBRF:
    def __init__(self, begin, end):
        self.begin = begin
        self.end = end
        self.result = {}
        self.data_dir = os.path.join(os.path.dirname(__file__), "parsed_data")
        self.soup = None

    def __get_cbr_page_soup__(self):
        """Функция, обращающаяся к определенной странице сайта ЦБ РФ и забирающая данные для дальнейшего парсинга"""
        url = "https://cbr.ru/hd_base/metall/metall_base_new/"
        params = {
            "UniDbQuery.Posted": "True",
            "UniDbQuery.From": self.begin.strftime("%d.%m.%Y"),
            "UniDbQuery.To": self.end.strftime("%d.%m.%Y"),
            "UniDbQuery.Gold": "true",
            "UniDbQuery.so": "1"
        }
        r = requests.get(url, params=params)
        r.raise_for_status()
        self.soup = BeautifulSoup(r.text, 'html.parser')

    def __parse_cbr_data__(self):
        """Функция, осуществляющая парсинг цен на золото"""
        table = self.soup.find("table")
        if table is None:
            return
        data_g = table.find_all("tr")[1:]
        for row in data_g:
            columns = row.find_all('td')
            date_str = columns[0].text
            price_str = columns[1].text.replace(',', '.').replace(' ', '')
            date_1 = datetime.strptime(date_str, "%d.%m.%Y").date()
            price_1 = Decimal(price_str)
            self.result[date_1.isoformat()] = price_1

    def __convert_to_json__(self):
        """Функция, записывающая полученные данные в файл в формате json"""
        if not os.path.exists(self.data_dir):
            os.makedirs(self.data_dir)
        with open(os.path.join(self.data_dir, "data.json"), "w", encoding="utf-8") as fp:
            json.dump(self.result, fp, ensure_ascii=False, indent=4, default=str)

    @staticmethod
    def load_data():
        """Функция, помещающая файл json в определенную директорию"""
        rates_file = os.path.join(os.path.dirname(__file__), "parsed_data", "data.json")
        with open(rates_file, "r") as f:
            return json.load(f)

    def start(self):
        self.__get_cbr_page_soup__()
        self.__parse_cbr_data__()
        self.__convert_to_json__()
        return self.result

def main():
    parser_date_1 = date(2024, 1, 1)
    parser_date_2 = date(2024, 6, 23)
    parser = ParserCBRF(parser_date_1, parser_date_2)
    gold_prices = parser.start()
    print(gold_prices)


if __name__ == "__main__":
    main()

class GoldPriceData:
    def __init__(self):
        self.data = self.load_data()

    @staticmethod
    def load_data():
        """Функция, обращающаяся к сохраненному в директории файлу json"""
        rates_file = os.path.join(os.path.dirname(__file__), "parsed_data", "data.json")
        with open(rates_file, "r") as f:
            data_1 = json.load(f)
            return {datetime.fromisoformat(k).date(): Decimal(v) for k, v in data_1.items()}

    def get_price(self, date_2: date) -> Decimal:
        """Функция, возвращающая цену на золото на определенную дату"""
        return self.data.get(date_2)

    def get_prices(self, start_date: date, end_date: date) -> dict:
        """Функция, возвращающая цены на золото за определенный период времени"""
        return {k.isoformat(): float(v) for k, v in self.data.items() if start_date <= k <= end_date}

    def get_average_price(self, start_date: date, end_date: date) -> Decimal:
        """Функция, возвращающая среднюю цену на золото за определенный период времени"""
        prices_1 = self.get_prices(start_date, end_date)
        total_price = Decimal(0)
        for av_price in prices_1.values():
            total_price += Decimal(av_price)
        average_price = total_price / Decimal(len(prices_1))
        return average_price.quantize(Decimal('0.01'))

    def get_min_price(self, start_date: date, end_date: date) -> Decimal:
        """Функция, возвращающая минимальную цену на золото за определенный период времени"""
        prices_2 = self.get_prices(start_date, end_date)
        return min(prices_2.values())

    def get_max_price(self, start_date: date, end_date: date) -> Decimal:
        """Функция, возвращающая максимальную цену на золото за определенный период времени"""
        prices_3 = self.get_prices(start_date, end_date)
        return max(prices_3.values())


data = GoldPriceData()
price = data.get_price(date(2024, 6, 11))
prices = data.get_prices(date(2024, 6, 1), date(2024, 6, 23))
avg_price = data.get_average_price(date(2024, 6, 1), date(2024, 6, 23))
min_price = data.get_min_price(date(2024, 6, 1), date(2024, 6, 23))
max_price = data.get_max_price(date(2024, 6, 1), date(2024, 6, 23))
print(f"Максимальная цена за период: {max_price}")
print(f"Минимальная цена за период: {min_price}")
print(f"Средняя цена за период: {avg_price}")
print(f"Цена на определенную дату: {price}")
print(f"Цены за период: {prices}")

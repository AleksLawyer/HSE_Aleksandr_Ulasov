import requests
from bs4 import BeautifulSoup

url = 'https://cbr.ru/hd_base/metall/metall_base_new/UniDbQuery.Posted=True&UniDbQuery;.From=20.05.2024&UniDbQuery;.To=25.05.2024&UniDbQuery;.Gold=true&UniDbQuery;.so=1'

response = requests.get(url)
soup = BeautifulSoup(response.text, 'html.parser')

table = soup.find('table', class_='data')

if table:
    rows = table.find_all('tr')
    for row in rows:
      cells = row.find_all('td')
      if len(cells) > 1:
        date = cells[0].text
        price = cells[1].text
        print(f'Дата: {date}, Цена: {price}')
else:
    print('Таблица не найдена на странице')

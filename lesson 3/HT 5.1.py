import json
import csv
path_1 = "traders.txt"
path_2 = "traders.json"
with open(path_1, 'r') as f_1:
    inn = f_1.read()
lines = inn.split("\n")
inn_list = []
for line in lines:
    if line != "":
        inn_list.append(line)
print(inn_list)
with open(path_2, "r") as f_2:
    json_data = json.load(f_2)
found_organizations = []
for trader in json_data:
    if trader['inn'] in inn_list:
        found_organizations.append(trader)
for organization in found_organizations:
    print(organization)
with open("traders.csv", "w", newline="") as f:
    writer = csv.writer(f, delimiter=";")
    writer.writerow(["INN", "OGRN", "ADDRESS"])
    for i in found_organizations:
        writer.writerow([i["inn"], i["ogrn"], i["address"]])










import json
import re
path = "1000_efrsb_messages.json"
def open_data():
    with open(path, "r") as f:
        json_data = json.load(f)
    return json_data
def main():
    data = open_data()
    email_pattern = re.compile(r"\b[0-9a-zA-Z.-_-]+@[0-9a-zA-Z._-]+\.[a-zA-Z]+\b")
    email_map = {}
    for i in data:
        temp = re.findall(email_pattern, i["msg_text"])
        if email_map.get(i["publisher_inn"]):
            email_map[i["publisher_inn"]] += temp
        else:
            email_map[i["publisher_inn"]] = temp
        email_map[i["publisher_inn"]] = list(set(email_map[i["publisher_inn"]]))
    return email_map
emails = main()
with open("emails.json", "w") as fp:
    json.dump(emails, fp)









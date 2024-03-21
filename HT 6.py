import ics
import json
from ics import Calendar
from datetime import datetime, timedelta
import zoneinfo

zone = zoneinfo.ZoneInfo("Europe/Moscow")

def task_3(case_number):
    with open(f"{case_number}.ics", "r") as f:
        raw_data = f.read()
    c = Calendar(raw_data)
    cleaned_events = [i for i in c.events if i.begin.datetime > datetime.now(zone) - timedelta(days=10000)]
    result = [{"case_number": f"{case_number}",
               "start": i.begin.datetime.isoformat(),
               "end": i.end.datetime.isoformat(),
               "location": i.location.strip(),
               "description": i.description
               } for i in cleaned_events]
    with open(f"{case_number}_listenings.json", "w") as f:
        json.dump(result, f)
    return result
def main():
    case_number = "А40-183194-2015"
    result = task_3(case_number)


if __name__ == "__main__":
    main()
    print("stop")
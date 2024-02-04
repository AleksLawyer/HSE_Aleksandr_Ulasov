participants = []

for participant_number in range(3):
    sign = input("Введите наименование участника: ")
    status = input("Введите статус участника: ")
    inn = input("Введите ИНН участника: ")

    participant = {
    "name": sign,
    "status": status,
    "inn": inn
    }

    participants.append(participant)

for participant in participants[0:1]:
     print(participants)

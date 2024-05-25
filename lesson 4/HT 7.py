class CourtCase:

    def __init__(self, case_number):
        self.case_number = case_number
        self.case_participants = []
        self.listening_datetimes = []
        self.is_finished = False
        self.verdict = None

    def set_a_listening_datetime(self, datetime):
        self.listening_datetimes.append(datetime)

    def add_participant(self, participant):
        self.case_participants.append(participant)

    def remove_participant(self, participant):
        if participant in self.case_participants:
            self.case_participants.remove(participant)

    def make_a_decision(self, verdict):
        self.verdict = verdict
        self.is_finished = True




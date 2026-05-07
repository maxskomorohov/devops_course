class Alphabet:
    def __init__(self, lang: str, letters: str):
        self.lang = lang
        self.letters = letters

    def print(self):
        print(self.letters)

    def letters_num(self):
        return len(self.letters)


class EngAlphabet(Alphabet):
    _letters = "abcdefghijklmnopqrstuvwxyz"
    _letters_num = len(_letters)

    def __init__(self):
        super().__init__("En", self._letters)

    def is_en_letter(self, char):
        if char.lower() not in self.letters:
            return False
        return True

    def letters_num(self):
        return self._letters_num

    @staticmethod
    def example():
        return "This is an example of text in English"

en_lang = EngAlphabet()
en_lang.print()
print(en_lang.letters_num())
print(en_lang.is_en_letter("F"))
print(en_lang.example())

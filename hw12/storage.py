import csv
from pathlib import Path

storage_dir = Path("data")
file_path = storage_dir / "students.csv"


def init_storage():
    storage_dir.mkdir(exist_ok=True)
    file_path.touch(exist_ok=True)


def read_students_rows():
    with open(file=file_path, mode="r", encoding="utf-8", newline="") as file:
        rows = list(csv.reader(file))

    clean_rows = []

    for row in rows:
        if len(row) == 4:
            clean_rows.append(row)

    return clean_rows


def write_students_rows(rows):
    with open(file=file_path, mode="w", encoding="utf-8", newline="") as file:
        writer = csv.writer(file)
        writer.writerows(rows)


def append_student_row(row):
    with open(file=file_path, mode="a", encoding="utf-8", newline="") as file:
        writer = csv.writer(file)
        writer.writerow(row)
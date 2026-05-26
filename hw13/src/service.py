from storage import read_students_rows, write_students_rows, append_student_row

def row_to_student(row):
    return {
        "id": int(row[0]),
        "name": row[1],
        "last_name": row[2],
        "age": int(row[3]),
    }


def student_to_row(student):
    return [
        student["id"],
        student["name"],
        student["last_name"],
        student["age"],
    ]


def get_students():
    rows = read_students_rows()
    students = []

    for row in rows:
        students.append(row_to_student(row))

    return students


def find_student_by_id(student_id):
    students = get_students()

    for student in students:
        if student["id"] == student_id:
            return student

    return None


def find_students_by_lastname(last_name: str):
    students = get_students()
    found_students = []

    for student in students:
        if student["last_name"].lower() == last_name.strip().lower():
            found_students.append(student)

    if found_students:
        return found_students

    return None


def get_last_student_id():
    students = get_students()

    if not students:
        return 0

    max_id = 0

    for student in students:
        if student["id"] > max_id:
            max_id = student["id"]

    return max_id


def save_student(data):
    student = {
        "id": get_last_student_id() + 1,
        "name": data["name"].strip().title(),
        "last_name": data["last_name"].strip().title(),
        "age": int(data["age"]),
    }

    append_student_row(student_to_row(student))

    return student


def update_student(student_id, data, partial=False):
    rows = read_students_rows()

    for index, row in enumerate(rows):
        student = row_to_student(row)

        if student["id"] == student_id:
            if partial:
                if "name" in data:
                    student["name"] = data["name"].strip().title()

                if "last_name" in data:
                    student["last_name"] = data["last_name"].strip().title()

                if "age" in data:
                    student["age"] = int(data["age"])
            else:
                student = {
                    "id": student_id,
                    "name": data["name"].strip().title(),
                    "last_name": data["last_name"].strip().title(),
                    "age": int(data["age"]),
                }

            rows[index] = student_to_row(student)
            write_students_rows(rows)

            return student

    return None


def delete_student(student_id):
    rows = read_students_rows()

    for index, row in enumerate(rows):
        student = row_to_student(row)

        if student["id"] == student_id:
            rows.pop(index)
            write_students_rows(rows)
            return student

    return None
import subprocess
import requests
from pprint import pprint

BASE_URL = "http://127.0.0.1:5000"
subprocess.run(["python", "app.py"])

# Отримати всіх наявних студентів (GET).

response = requests.get(f"{BASE_URL}/students", timeout=5)
print()
print("GET /students".center(50, "-"))
print(f"Status code: {response.status_code}")
print(f"Server response: {response.json()}")

# Створити трьох студентів (POST).

student_data = [
    {"name": "Jack", "last_name": "Smith", "age": 25, },
    {"name": "Mike", "last_name": "Peters", "age": 40, },
    {"name": "Tom", "last_name": "Jacobs", "age": 53, },
]

print()
print("POST /students".center(50, "-"))
for student in student_data:
    response = requests.post(f"{BASE_URL}/students", timeout=5, json=student)
    print(f"Status code: {response.status_code}")
    print(f"Server response: {response.json()}")

# Отримати інформацію про всіх наявних студентів (GET).

response = requests.get(f"{BASE_URL}/students", timeout=5)
print()
print("GET /students".center(50, "-"))
print(f"Status code: {response.status_code}")
print("Server response:")
pprint(response.json())

# Оновити вік другого студента (PATCH).
student_id = 2

print()
print(f"PATCH /student/{student_id}".center(50, "-"))
response = requests.patch(f"{BASE_URL}/students/{student_id}", timeout=5, json={
    "age": 65
})
print(response.status_code)
print(response.json())

# Отримати інформацію про другого студента (GET).

print()
print(f"GET /student/{student_id}".center(50, "-"))
response = requests.get(f"{BASE_URL}/students/{student_id}")
print(response.status_code)
print(response.json())

# Оновити імʼя, прізвище та вік третього студента (PUT).
student_id = 3

print()
print(f"PUT /student/{student_id}".center(50, "-"))
response = requests.put(f"{BASE_URL}/students/{student_id}", timeout=5, json={
    "name": "Tom",
    "last_name": "Smith",
    "age": 43
})
print(response.status_code)
print(response.json())

# Отримати інформацію про третього студента (GET).

print()
print(f"GET /student/{student_id}".center(50, "-"))
response = requests.get(f"{BASE_URL}/students/{student_id}")
print(response.status_code)
print(response.json())

# Отримати всіх наявних студентів (GET).

response = requests.get(f"{BASE_URL}/students", timeout=5)
print()
print("GET /students".center(50, "-"))
print(f"Status code: {response.status_code}")
print("Server response:")
pprint(response.json())


# Отримати всіх студентів з однаковим прізвищем
last_name = "Smith"

response = requests.get(f"{BASE_URL}/students/lastname/{last_name}", timeout=5, json={
    "last_name": last_name
})
print()
print("GET /students".center(50, "-"))
print(f"Status code: {response.status_code}")
print("Server response:")
pprint(response.json())



# Видалити першого користувача (DELETE).

student_id = 1
print()
print(f"DELETE /student/{student_id}".center(50, "-"))
response = requests.delete(f"{BASE_URL}/students/{student_id}", timeout=5)
print(response.status_code)
print(response.json())


# Отримати всіх наявних студентів (GET).

response = requests.get(f"{BASE_URL}/students", timeout=5)
print()
print("GET /students".center(50, "-"))
print(f"Status code: {response.status_code}")
print("Server response:")
pprint(response.json())


def validate_student_data(data: dict, method: str):
    if method == "POST" or method == "PUT":
        required_fields = {"name", "last_name", "age"}

        if set(data.keys()) != required_fields:
            return False, "Invalid params"

        if not data["name"].strip():
            return False, "Name cannot be empty"

        if not data["last_name"].strip():
            return False, "Last name cannot be empty"

        if not str(data["age"]).isdigit() or int(data["age"]) <= 0:
            return False, "Age should be a positive number"

    if method == "PATCH":
        allowed_fields = {"name", "last_name", "age"}
        if not data:
            return False, "No fields provided"
        if not set(data.keys()).issubset(allowed_fields):
            return False, "Invalid params"
        if "name" in data and not str(data["name"]).strip():
            return False, "Name cannot be empty"
        if "last_name" in data and not str(data["last_name"]).strip():
            return False, "Last name cannot be empty"
        if "age" in data and (not str(data["age"]).isdigit() or int(data["age"]) <= 0):
            return False, "Age should be a positive number"

    return True, None


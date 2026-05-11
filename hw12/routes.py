from flask import request

from responses import success_response, error_response
from validators import validate_student_data
from service import (
    get_students,
    find_student_by_id,
    find_students_by_lastname,
    save_student,
    update_student,
    delete_student,
)


def register_routes(app):
    @app.route("/students", methods=["GET", "POST"])
    def students():
        if request.method == "GET":
            students_data = get_students()

            return success_response(
                message="Students received successfully",
                data=students_data
            ), 200

        if request.method == "POST":
            data = request.get_json(silent=True) or {}

            is_valid_request, error = validate_student_data(data, request.method)

            if not is_valid_request:
                return error_response(message=error), 400

            saved_student = save_student(data)

            return success_response(
                message="Successfully created student",
                data=saved_student
            ), 201


    @app.route("/students/<int:student_id>", methods=["GET", "PUT", "PATCH", "DELETE"])
    def student_by_id(student_id):
        student = find_student_by_id(student_id)

        if student is None:
            return error_response(
                message=f"Student with id {student_id} not found"
            ), 404

        if request.method == "GET":
            return success_response(
                message=f"Found student with id {student_id}",
                data=student
            ), 200

        if request.method == "PUT" or request.method == "PATCH":
            data = request.get_json(silent=True) or {}

            is_valid_request, error = validate_student_data(data, request.method)

            if not is_valid_request:
                return error_response(message=error), 400

            partial = request.method == "PATCH"

            updated_student = update_student(student_id, data, partial)

            return success_response(
                message=f"Successfully updated student with id: {student_id}",
                data=updated_student
            ), 200

        if request.method == "DELETE":
            deleted_student = delete_student(student_id)

            return success_response(
                message=f"Successfully deleted student with id: {student_id}",
                data=deleted_student
            ), 200


    @app.route("/students/lastname/<last_name>", methods=["GET"])
    def student_by_lastname(last_name):
        found_students = find_students_by_lastname(last_name)

        if found_students is None:
            return error_response(
                message=f"No data with last name '{last_name}' found"
            ), 404

        return success_response(
            message=f"Students with last name {last_name} successfully found",
            data=found_students
        ), 200
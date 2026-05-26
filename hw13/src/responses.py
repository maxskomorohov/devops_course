def success_response(message=None, data=None):
    response = {
        "success": True,
    }
    if message is not None:
        response["message"] = message
    if data is not None:
        response["data"] = data
    return response


def error_response(message=None, data=None):
    response = {
        "success": False,
    }
    if message is not None:
        response["message"] = message
    if data is not None:
        response["data"] = data
    return response
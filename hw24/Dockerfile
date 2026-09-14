FROM python:3.14-slim

RUN apt update -y

WORKDIR /var/app

COPY . .

CMD ["python", "./src/python-random.py"]
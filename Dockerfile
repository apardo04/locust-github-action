FROM python:3.8.3-buster

RUN pip install locust==1.0.1

COPY locustfile.py /locustfile.py
COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
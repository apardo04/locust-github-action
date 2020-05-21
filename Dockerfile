FROM python:3.8-slim-buster

RUN pip install locust==1.0.1

COPY locustfile.py /locustfile.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
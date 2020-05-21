FROM python:3.6.10-alpine3.11

RUN pip install locust==1.0.1

COPY locustfile.py /locustfile.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
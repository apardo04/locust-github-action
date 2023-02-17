FROM python:3.8.3-buster

COPY locustfile.py /locustfile.py
COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt


ENTRYPOINT ["/entrypoint.sh"]
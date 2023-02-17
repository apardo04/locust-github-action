from locust import HttpUser, TaskSet, task, between
import flask
import requests
import pandas as pd

print("pandas version:")
print(pd.__version__)

response = requests.get("https://www.google.com")
print("requests status code:")
print(response.status_code)

print("Flask Version:")
print(flask.__version__)

class UserTasks(TaskSet):
	@task(1)
	def index(self):
		self.client.get("/")

class WebsiteUser(HttpUser):
	tasks = [UserTasks]
	wait_time = between(1, 5)
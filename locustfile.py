from locust import HttpUser, TaskSet, task, between
import flask
import pandas as pd

print("Pandas Version:")
print(pd.__version__)

print("Flask Version:")
print(flask.__version__)

class UserTasks(TaskSet):
	@task(1)
	def index(self):
		self.client.get("/")

class WebsiteUser(HttpUser):
	tasks = [UserTasks]
	wait_time = between(1, 5)
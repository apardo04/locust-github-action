from locust import HttpUser, TaskSet, task, between
import os

user = os.environ.get('GITHUB_USERNAME')
testVar = "ayyyyyy"
print("GITHUB_USERNAME = ", os.environ.get('GITHUB_USERNAME'))
print("user = ", user)
print("testVar = ", testVar)

class UserTasks(TaskSet):
	@task(1)
	def index(self):
		self.client.get("/")

class WebsiteUser(HttpUser):
	tasks = [UserTasks]
	wait_time = between(1, 5)
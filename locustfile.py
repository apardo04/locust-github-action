from locust import HttpUser, TaskSet, task, between
import os

username = os.environ.get('GITHUB_USERNAME')

class UserTasks(TaskSet):
	@task(1)
	def index(self):
		self.client.get("/")

class WebsiteUser(HttpUser):
	tasks = [UserTasks]
	wait_time = between(1, 5)
from locust import HttpUser, TaskSet, task, between
import os

user = os.environ.get('GITHUB_USERNAME')
user2 = os.environ['GITHUB_USERNAME']
testVar = "ayyyyyy"
print("GITHUB_USERNAME = ", os.environ.get('GITHUB_USERNAME'))
print("user = ", user)
print("user2 = ", user2)
print("testVar = ", testVar)

if os.getenv('GITHUB_USERNAME'):
    print('Looks like GitHub!')
else:
    print('Maybe running locally?')

class UserTasks(TaskSet):
	@task(1)
	def index(self):
		self.client.get("/")

class WebsiteUser(HttpUser):
	tasks = [UserTasks]
	wait_time = between(1, 5)
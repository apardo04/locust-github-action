# Load Testing with Locust
A GitHub action for load testing using Locust

### Sample Workflow
```yml
name: Test Locust Load Test

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Run Load Test
        uses: apardo04/locust-github-action@master
        with:
          LOCUSTFILE: "locustfile.py"
          REQUIREMENTS: "requirements.txt"
          URL:  "https://google.com"
          USERS: "5"
          RATE: "5"
          RUNTIME: "10s"
```

### Arguments
 - `LOCUSTFILE`: The locustfile you want to use to load test. If no file is provided, a simple load test will be done on the landing page of the provided URL.
 - `REQUIREMENTS`: requirements.txt file you want to use. Not required. 
 - `URL`: URL to the site you want to load test. This is Required.
 - `USERS`: Number of Users to spawn. Not required, defaults to 5.
 - `RATE`: Specify the hatch rate (number of users to spawn per second). Not required, defaults to 5.
 - `RUNTIME`: Specify the run time for a test. Not required, defaults to 10 seconds.

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
 - `REQUIREMENTS`: requirements.txt file you want to use to install 3rd party dependencies. Not required. 
 - `URL`: URL to the site you want to load test. This is Required.
 - `USERS`: Number of Users to spawn. Not required, defaults to 5.
 - `RATE`: Specify the hatch rate (number of users to spawn per second). Not required, defaults to 5.
 - `RUNTIME`: Specify the run time for a test. Not required, defaults to 10 seconds.
 
### Installing 3rd party dependencies for your locustfile
Please see this branch as an example: https://github.com/apardo04/locust-github-action/tree/requirements-test
  1. Make sure your repo has a [requirements.txt](https://github.com/apardo04/locust-github-action/blob/requirements-test/test/requirements.txt) file.
  2. In your [workflows yml file](https://github.com/apardo04/locust-github-action/blob/requirements-test/.github/workflows/test.yml), use the REQUIREMENTS input and pass it the path to the file.
  3. Import the dependencies in your [locustfile.py](https://github.com/apardo04/locust-github-action/blob/requirements-test/locustfile.py)

### Using a specific version of locust
  1. Decalare a specific version in your requirements.txt file (See Installing 3rd party dependencies above)
  ```yml
  locust==2.5.1
  ```
### Passing Github Secrets to locustfile
Please see this branch as an example: https://github.com/apardo04/locust-github-action/tree/env-var-test
  1. Create a repository secret in Github.
  2. Assign it to an env variable (ex: 'GITHUB_USERNAME') in the workflows yml file: https://github.com/apardo04/locust-github-action/blob/env-var-test/.github/workflows/test.yml
  3. Reference the env variable in locustfile: https://github.com/apardo04/locust-github-action/blob/env-var-test/locustfile.py

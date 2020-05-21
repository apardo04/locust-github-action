# URL Checker
A GitHub action to load testing using Locust

### Sample Workflow
```yml
name: Sample Workflow

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Check URLs
        uses: apardo04/locust@master
        with:
          locustfile: "locustfile.py"
          URL: "https://mywebsite.com"
```

### Arguments
 - `locustfile`: The locustfile you want to use to load test. If no file is provided, a simple load test will be done on the landing page of the provided URL.
 - `URL`: URL to the site you want to load test

### Sample Output

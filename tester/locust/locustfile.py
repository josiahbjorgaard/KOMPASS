from locust import HttpLocust, TaskSet, task
class UserBehavior(TaskSet):
    def on_start(self):
        """ on_start is called when a Locust start before 
            any task is scheduled
        """
    @task
    def runspark(self):
        with self.client.get("/?nodes=4&input=10", catch_response=True) as response:
            if response.status_code is not 200:
                response.failure("HTTP returned " + str(response.status_code))
            if response.text.find("Succeeded") > 0: # Text is on the page
                response.success()
            else:
                response.failure("Succeeded not found in Spark-submit response")

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
    min_wait = 1000
    max_wait = 1000

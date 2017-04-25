# Snowplow Implementation Example

Here we try to demonstrate the use of Snowplow to only track the events, using Kafka as the 'collector', releasing you from the pain of implement the full stack.

## Requirements

To run locally we start from the point that you have:

 * Latest version of Python 3
 * virtualenv

## How to run locally

### Step 1

Build the image from `stream-collector` directory with: `docker build -t kafkasp .`


### Step 2

Duplicate the _docker-compose.exampe.yaml_ to **docker-compose.yaml**, replacing `DOCKER_IP_HERE` with the proper IP.

### Step 3

`docker-compose up`

### Step 4.1

Create a virtual environment called **.venv** with: 

 * `virtualenv -p python3 .venv` then,
 * `source ./venv/bin/activate`

### Step 4.2

Install the dependencies from `requirements.txt` running: `./.venv/bin/python3 -m pip install -r requirements.txt`
> Remember that here we are assuming the latest version of python 3

### Step 5

Send some events to Kafka: `./.venv/bin/python3 tracker_example.py`
> Here, the 'Tracker' and 'Collector' (The two first Snowplow's components) show their faces.

### Step 6

Consume the messages produced by the collector, and make whatever you want!

`./kafka_consumer_example.py consume DOCKER_IP_HERE:9092 topic_1 group_1`

___

**Tip**: You can access kafka manager application just to check if the messages are comming.

_The kafka manager was deployed at step 3, and (hopefully) listening in `9000`._
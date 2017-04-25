#!/usr/bin/env python
# -*- coding: utf-8 -*-
import click
from kafka import KafkaConsumer
import decode

@click.group()
def cli():
    pass


@cli.command()
@click.argument('host')
@click.argument('topic')
@click.argument('consumer_group')
@click.option('--output_file', default='events_output.json')
def consume(host, topic, consumer_group, output_file):
    params = {
      'group_id': consumer_group,
      'bootstrap_servers': host,
    }
    consumer = KafkaConsumer(topic, **params)

    for message in consumer:
      print(message.topic, message.offset, message.key)
      print(decode.decode_msg(message.value))
      print('--------'*10)


if __name__ == "__main__":
    cli()

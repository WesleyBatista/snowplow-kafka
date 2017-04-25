"""
Thanks to mike!
http://discourse.snowplowanalytics.com/t/decoding-real-time-bad-records-thrift-tutorial/854
"""
import base64
import thriftpy
from thriftpy.protocol import TCyBinaryProtocolFactory
from thriftpy.utils import deserialize, serialize
from urllib import parse

STRUCTS = thriftpy.load("structs.thrift")

def decode_msg(kafka_msg):
    raw_payload = deserialize(STRUCTS.CollectorPayload(), kafka_msg, TCyBinaryProtocolFactory())
    querystring = raw_payload.querystring
    obj = raw_payload.__dict__
    obj['querystring_parsed'] = parse.parse_qs(raw_payload.querystring)
    return obj
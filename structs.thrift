/* 
 * Copyright (c) 2013-2014 Snowplow Analytics Ltd. All rights reserved.
 *
 * This program is licensed to you under the Apache License Version 2.0, and
 * you may not use this file except in compliance with the Apache License
 * Version 2.0.  You may obtain a copy of the Apache License Version 2.0 at
 * http://www.apache.org/licenses/LICENSE-2.0.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the Apache License Version 2.0 is distributed on an "AS
 * IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied.  See the Apache License Version 2.0 for the specific language
 * governing permissions and limitations there under.
 */

/*
 * Files copied from: 
 * https://github.com/snowplow/snowplow/blob/993c6ff/2-collectors/thrift-schemas/collector-payload-1/src/main/thrift/collector-payload.thrift
 * https://github.com/snowplow/snowplow/blob/e111f00/2-collectors/thrift-schemas/snowplow-raw-event/src/main/thrift/snowplow-raw-event.thrift
 */

namespace java com.snowplowanalytics.snowplow.collectors.thrift
namespace java com.snowplowanalytics.snowplow.CollectorPayload.thrift.model1

enum PayloadProtocol {
  Http = 1
}

enum PayloadFormat {
  HttpGet = 1
  HttpPostUrlencodedForm = 10
  HttpPostMultipartForm = 11
}

typedef string PayloadData

struct TrackerPayload {
  1: PayloadProtocol protocol
  2: PayloadFormat format
  3: PayloadData data
}

struct SnowplowRawEvent {
  01: i64 timestamp // Milliseconds since epoch.
  20: string collector // Collector name/version.
  30: string encoding
  40: string ipAddress
  41: optional TrackerPayload payload
  45: optional string hostname
  50: optional string userAgent
  60: optional string refererUri
  70: optional list<string> headers
  80: optional string networkUserId
}


struct CollectorPayload {
  31337: string schema

  // Required fields which are intrinsic properties of HTTP
  100: string ipAddress

  // Required fields which are Snowplow-specific
  200: i64 timestamp
  210: string encoding
  220: string collector

  // Optional fields which are intrinsic properties of HTTP
  300: optional string userAgent
  310: optional string refererUri
  320: optional string path
  330: optional string querystring
  340: optional string body
  350: optional list<string> headers
  360: optional string contentType

  // Optional fields which are Snowplow-specific
  400: optional string hostname
  410: optional string networkUserId
}
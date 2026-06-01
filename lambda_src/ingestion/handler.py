import json

def lambda_handler(event, context):
    print("EVENT RECEIVED:")
    print(json.dumps(event, indent=2))

    for record in event["Records"]:
        body = json.loads(record["body"])

        print("S3 EVENT:")
        print(json.dumps(body, indent=2))

    return {
        "statusCode": 200
    }
import json
import urllib.parse
import boto3

s3_client = boto3.client("s3")

def lambda_handler(event, context):
    print("Received event:")
    print(json.dumps(event))

    for record in event.get("Records", []):
        bucket_name = record["s3"]["bucket"]["name"]
        object_key = urllib.parse.unquote_plus(record["s3"]["object"]["key"])

        print(f"Bucket: {bucket_name}")
        print(f"Object key: {object_key}")

        response = s3_client.head_object(
            Bucket=bucket_name,
            Key=object_key
        )

        print("Object metadata:")
        print(json.dumps(response, default=str))

        # TODO:
        # - validate file
        # - save metadata to DynamoDB
        # - trigger ETL
        # - call Step Functions ...

    return {
        "statusCode": 200,
        "body": json.dumps("S3 event processed successfully.")
    }
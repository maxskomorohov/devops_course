import boto3
from botocore.exceptions import ClientError

ec2 = boto3.client("ec2", region_name="eu-central-1")


def lambda_handler(event, context):
    resp = ec2.describe_instances(
        Filters=[
            {
                "Name": "tag:Lambda",
                "Values": ["True"]
            },
            {
                "Name": "instance-state-name",
                "Values": ["pending", "running", "stopping", "stopped"]
            }
        ]
    )

    instance_ids = []

    for reservation in resp["Reservations"]:
        for instance in reservation["Instances"]:
            instance_ids.append(instance["InstanceId"])

    if not instance_ids:
        print("No active instances found with tag: Lambda=True")
        return

    print(f"Instances found: {len(instance_ids)}. Instance IDs: {instance_ids}")
    try:
        terminate_resp = ec2.terminate_instances(
            InstanceIds=instance_ids
        )

        status_code = terminate_resp["ResponseMetadata"]["HTTPStatusCode"]

        print(f"Terminated instances: {instance_ids}")
        print(f"Count: {len(instance_ids)}")
        print(f"Termination response status code: {status_code}")

    except ClientError as error:
        print(f"Failed to terminate instances: {error}")

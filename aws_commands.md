#### Get AWS Current Account Details
```aws sts get-caller-identity```

#### Create S3 Bucket
```aws s3api create-bucket --bucket "account ID" --region us-east-1```

#### Enumerate S3 Buckets
```aws s3api list-buckets --query "Buckets[].Name"```

#### List Contents of S3 Bucket
```aws s3 ls s3://"bucket name" --region us-east-1```

#### Tag S3 Bucket
```export S3BUCKET=`aws s3api list-buckets --query "Buckets[].Name" | jq -r ".[0]"````
```aws s3api put-bucket-versioning --bucket $S3BUCKET --versioning-configuration Status=Enabled```

#### Download Contents of S3 Bucket
```aws s3 sync . s3://"bucket name"```

#### Identify Instances in Account for Specific Region
```aws ec2 describe-instances --region us-east-1```

#### Identify List of Lambda Functions
```aws lambda list-functions --region us-east-1```

#### List IAM Users
```aws iam list-users```

#### List Policies
```aws iam list-policies```

#### List Databases
```aws rds describe-db-instances --region us-east-1```
```aws rds describe-db-instances --query 'DBInstances[].DBInstanceIdentifier' --region us-east-1```

#### List Public Databases
```aws rds describe-db-instances --query 'DBInstances[?PubliclyAccessible=="true"].[DBInstanceIdentifier,Endpoint.Address]' --region us-east-1```


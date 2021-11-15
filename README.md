# lab-terraform
Personal Terraform lab

## Environement
* AWS CLI
* Terraform CLI
* Make sure to set up user at <strong>AWS IAM</strong>
* Add the user on AWS CLI using <strong>aws configure</strong>
```
aws configure
AWS Access Key ID [None]: <Acceess key ID>
AWS Secret Access Key [None]: <Secret Access Key>
Default region name [ap-northeast-2]: ap-northeast-2
Default output format [json]:
```
* Check if the user id is successfully registered on AWS CLI
```
aws sts get-caller-identity
```


## Hot to import?
1. Clone this repository.
```
git clone https://github.com/ellisjoe611/lab-terraform.git
```

2. Initialize
```
terraform init
```
3. Import modules
```
terraform import aws_s3_bucket.initial bucket_name 
```
```
terraform import aws_vpc.initial vpc_id
```
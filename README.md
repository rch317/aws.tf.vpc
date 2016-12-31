## aws.tf.vpc
Generic plan for creating a VPC in AWS. Based in part on the best-practices repo provided by Hashicorp (https://github.com/hashicorp/best-practices). That plan assumes you will be using Atlas, which I unfortunately do not have access to.


#### What this project will build out for you
- Network
  - VPC
  - Public subnets
  - Private subnets
  - NAT Gateway
    - AWS NAT Gateway and "physical" NAT for public subnets
  - Security Groups
  - Bastion host(s)
    - To ASG or Not to ASG... That is the question!

#### Set Local Environment Variables
Set the below environment variables or this won't work...

    $ export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
    $ export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
    $ export AWS_DEFAULT_REGION=us-east-1

##### Update the `init` script
Edit the `init` script, modifying the variables below:
- PROJECT
  - This is the project folder where your state file will be stored
- BUCKET
  - This is the S3 bucket you plan to use

```sh
PROJECT="Terraform/dev.us-west-2"
BUCKET="ngc-devops"
```

##### Using this plan
Use the Makefile to:
- make config
  - This will configure the remote state
make plan

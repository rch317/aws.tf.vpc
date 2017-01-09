## aws.tf.vpc
Generic plan for creating a VPC in AWS. Based in part on the best-practices repo provided by Hashicorp (https://github.com/hashicorp/best-practices). That plan assumes you will be using Atlas, which I unfortunately do not have access to.


#### What this project will build out for you
- Network
  - VPC
  - Public subnets
  - Private subnets
  - NAT Gateway
    - AWS NAT Gateway and "physical" NAT for public subnets
      - Currently debating the need for a physical NAT in public subnets
  - Security Groups
  - Bastion host(s)
    - To ASG or Not to ASG... That is the question!
      - Currently do not provision the ASG - work in progress

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
PROJECT="Terraform"
BUCKET="my-s3-bucket"
```

##### Using this plan
Use the Makefile to:
- make config
  - This will configure the remote state
- make plan
  - This will create/update your plan file
- make apply
  - This will apply the plan. Make sure you review the plan before running the apply
- make destroy
  - This will destroy your build, currently there is a 10 second delay to allow time for aborting this choice.


####
end.

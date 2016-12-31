## aws.tf.vpc

Generic plan for creating a VPC in AWS. Based in part on the best-practices repo provided by Hashicorp (https://github.com/hashicorp/best-practices). That plan assumes you will be using Atlas, which I unfortunately do not have access to.


### What this project will build out for you

- Network
  - VPC
  - Public subnets
  - Private subnets
  - NAT Gateway
    - AWS NAT Gateway and "physical" NAT for public subnets
  - Security Groups
  - Bastion host(s)
    - To ASG or Not to ASG... That is the question!

### Using this plan

##### Set Local Environment Variables

Set the below environment variables if you'll be using Packer or Terraform locally.

    $ export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
    $ export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
    $ export AWS_DEFAULT_REGION=us-east-1

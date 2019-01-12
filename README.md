# terraform-FizzBuzz-Debasish
Manage FizzBuzz Challenge on AWS VPC with Terraform - Infrastructure as Code 

# Challenge:

working infrastructure-as-code example that provisions a service to execute an implementation of the below FizzBuzz coding challenge 

"Write a program that prints the numbers from 1 to 100.
But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”."


# Solution:

To accomplish this task, we are going to use terraform to setup our infrastructure in AWS. We will create VPC, public subnet, security group, internet gateway, route table, EC2 instance on the top, we will install “git” to clone my git repository. We are using python language to print 1 to 100 considering the requirement.

Terraform is one of the tools which can be used for building, changing, versioning our infrastructure safely and efficiently; which supports many service providers as well as custom in-house solutions.We are going to use AWS as provider in my case.

The first step towards running terraform code is to download and do the installation.You can download the terraform code files (explained below) from my git repository. 

provider.tf ---- used to declare “aws” as provier

variables.tf ---- used to have various variables

user_data.sh --- to be run as “user_data” while ec2 instance boot up to clone git repo.

vpc.tf --- main configuration file for aws resources setup


# Usage
To run this you need to execute:
$export AWS_ACCESS_KEY_ID=xxxxxxxx

$export AWS_SECRET_ACCESS_KEY=xxxxxx

$ terraform init

$ terraform plan

$ terraform apply

Run terraform destroy when you don't need these resources.

Once we confirm then all operations are applied on aws.

check the attached screenshot for entire setup session output.

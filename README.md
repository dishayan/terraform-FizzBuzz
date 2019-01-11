# terraform-FizzBuzz
Manage FizzBuzz Challenge on AWS VPC with Terraform - Infrastructure as Code 

Challenge:

Write a program that prints the numbers from 1 to 100.
But for multiples of three print “Fizz” instead of the number and for the multiples of five print “Buzz”. For numbers which are multiples of both three and five print “FizzBuzz”.


Solution:
To accomplish this task, we are going to use terraform to setup our infrastructure in AWS. We will create VPC, public subnet, security group, internet gateway, route table, EC2 instance on the top, we will install “git” to clone my git repository. We are using python language to print 1 to 100 considering the requirement.

Terraform is one of the tools which can be used for building, changing, versioning our infrastructure safely and efficiently; which supports many service providers as well as custom in-house solutions.We are going to use AWS as provider in my case.

The first step towards running terraform code is to download and do the installation. The first command to run for a new configuration is “terraform init” which initialises various settings and data, download provider plugin and install in a subdirectory of the current working directory.

Once we init, we want to know what exactly is going to happen on aws infrastructure, this can be done by running command terraform plan. Terraform plan is used to create an execution plan which is a way to check whether the set of changes matches our expectation without making any real infrastructure changes.

This is the time to actually create our resources on aws, terraform apply command is used to apply the changes required to reach the desired state. Terraform apply scans current directory for the configuration and apply the changes on aws. When we run apply it shows us plan and ask for confirmation before executing the plan.

Once we confirm then all operations are applied on aws.

You can download the terraform code files (explained below) from my git repository. 

provider.tf ---- used to declare “aws” as provier 
variables.tf ---- used to have various variables
user_data.sh --- to be run as “user_data” while ec2 instance boot up to clone git repo.
vpc.tf --- main configuration file for aws resources setup

Please don’t forget to export your AWS credentials before running terraform commands.
 
export AWS_ACCESS_KEY_ID=xxxxxxxx
export AWS_SECRET_ACCESS_KEY=xxxxxx



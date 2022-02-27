# Build AWS Infrastructure with Terraform and good practices

This Article will help you to learn and boost your career with terraform and AWS (Amazon Web Services) as the cloud provider.
Terraform generates an execution plan describing what it will do to reach the desired state, and then executes it to build the described infrastructure. As the configuration changes, Terraform can determine what changed and create incremental execution plans which can be applied.

Terraform Cycle

![This is an image](https://github.com/Rifwan22/Terraform_basics/blob/main/terraformcycle.png)


I will only provision resources that qualify under the AWS free tier so you can practice with me if you need other resources to create please follow Terraform Documentation.

I'm gonna install below tools and configure on my laptop or my virtual machine:

1. The Terraform CLI (0.14.9+) installed.
2. The AWS CLI installed.
3. An AWS account.

Your AWS credentials. You can create a new Access Key on this page.
Besides having Terraform installed, to create the infrastructure you will need your AWS account configured to run CLI, Run the below command and You will need to add the value of your AWS Access Key ID and Secret Access Key that you can find in the IAM service section.

```
aws configure
```

The configuration process stores your credentials in a file at ~/.aws/credentials on MacOS and Linux, or %UserProfile%\.aws\credentials on Windows.
Terraform Config file

Lets create a terraform file called mymain.tf and The file below will contain the resources needed to have an instance of a Linux server running on AWS

* required_providers

we are telling Terraform that we want to use AWS as our cloud provider we add a configuration called aws

Now we need to configure our provider, for that we create a provider named aws and inside we describe the profile of our AWS account that will be used and in which region we want to create our resources.

Last but not the least, we add a resource of the type aws_instance and pass the configuration that matches the Linux server we want to run.

Ok, now let’s go to the AWS account and start to map the concepts on the file above with the actual resources.

First, go the ‘Services’ and search for EC2 (Elastic Compute Cloud), click it. You will land on a page that will show the EC2 resources that are associated with your account. Search for the ‘Launch Instance’ button and press it. You will now see a list of AMIs (Amazon Machine Image), check the filter ‘Free Tier’, and copy the AMI value that is 

below the name of the Linux server. Use that value in the mymain.tf file in the ami property.

The next step is to press the ‘Select’ button for the AMI you have to choose before. You will see the list of the available instance types, choose one from the free tier and copy the value on the column ‘Type’ to the mymain.tf file pasting it in the instance_type property.
In the tags section, you can specify the name of the EC2 instance you are going to create. This name is then used in the column ‘Name’ in the EC2 instances table inside your AWS account.

### Initialize and create

initiate our infrastructure configuration by running

```
terraform init
```
By now Terraform has downloaded the AWS provider plugins and stored the provider configuration in a file called .terraform*
terraform apply

Now, you can see the plan that Terraform tends to execute, it shows the actions that will be performed once you enter the value ‘yes’ in the console terminal.
You will now see the resource being created in the console output and in the end, the resume of the resources added, changed, and destroyed by Terraform.
If you go to your AWS account and choose EC2 you will see an instance called ‘My Linux machine’, that’s your Linux server up and running.

Now, go to the file mymain.tf, change the name of the instance inside the tags sections and run

```
terraform refresh
```
This will generate a new plan with the new instance name, run the apply command again and check the new name in the EC2 section in your AWS account.
To finish we will terminate the EC2 instance by running

```
terraform destroy
```

You can now see a plan in the console terminal to destroy the resources and terminate the EC2 instance once confirm by writing the value ‘yes’. If you go to your AWS account and choose EC2 you will see that the instance is in the state ‘Terminated’.

## Good practices

### Use terraform plugging's and providers in your local directory

As a good practice when we are working in a large organization we are not exposing to internet sometimes, so in such scenarios you should download the required providers and plugging to your local running directory and configure. automate this according to your requirement.

### Always use a remote Backend config to store your state file

If a configuration includes no backend block, Terraform defaults to using the local backend, which stores state as a plain file in the current working directory. — backend configs

for more good practices found this link on github — https://github.com/ozbillwang/terraform-best-practices

This article was built using the following references:
1.  [Terraform Website](https://www.terraform.io/)
2.  [Amazon Web Services Website](https://aws.amazon.com/)

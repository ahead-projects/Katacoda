A cloudformation template (cfn) is a JSON- or YAML-formatted text file that describes your AWS infrastructure.

## View code

First, look the content of the `EC2InstanceWithSecurityGroupSample.template` file 

(NOTES: This template is copied from https://s3.ap-southeast-2.amazonaws.com/cloudformation-templates-ap-southeast-2/EC2InstanceWithSecurityGroupSample.template)

`more EC2InstanceWithSecurityGroupSample.template`{{execute}}

You don't have to edit the code. It defines two resources: ec2 instance and its security group

[the whole template anatomy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html) has several sessions, only resources is required, the rest are all optional.

```
{
  "AWSTemplateFormatVersion" : "version date",

  "Description" : "JSON string",

  "Metadata" : {
    template metadata
  },

  "Parameters" : {
    set of parameters
  },

  "Mappings" : {
    set of mappings
  },

  "Conditions" : {
    set of conditions
  },

  "Transform" : {
    set of transforms
  },

  "Resources" : {
    set of resources
  },

  "Outputs" : {
    set of outputs
  }
}
```
Mostly The template has 3 main sessions: `Parameters`, `Resources`, `Outputs`,

## create keypair

This template need an existing EC2 KeyPair to enable SSH access to the instance

`aws ec2 create-key-pair --key-name MyKeyPair`{{execute}}

## Create stack

nit` command. Terraform searches the configuration for both direct and indirect references to providers (such as Docker). Terraform then attempts to load the required plugins.

`aws cloudformation create-stack --stack-name my-stack --template-body file://EC2InstanceWithSecurityGroupSample.template --parameters ParameterKey=KeyName,ParameterValue=MyKeyPair`{{execute}}

## verify

`aws ec2 describe-instances`{{execute}}

`aws ec2 describe-instances |jq .Reservations[].Instances[].KeyName`{{execute}}

`aws ec2 describe-instances |jq .Reservations[].Instances[].InstanceType`{{execute}}

## Update stack

Now update instance type to t2.small

`aws cloudformation create-stack --stack-name my-stack --template-body file://EC2InstanceWithSecurityGroupSample.template --parameters ParameterKey=KeyName,ParameterValue=MyKeyPair --parameters ParameterKey=InstanceType,ParameterValue=t2.small`{{execute}}

## Verify

`aws ec2 describe-instances |jq .Reservations[].Instances[].InstanceType`{{execute}}

## Delete stack

To remove the stack, run the delete-stack command.

`aws cloudformation delete-stack --stack-name my-stack`{{execute}}

## Conclusion

You have now created and destroyed your first aws resourcesi via cloudformation template!

Continue learning at 

[AWS Cloudformation commands](https://docs.aws.amazon.com/cli/latest/reference/cloudformation/index.html#cli-aws-cloudformation)

[AWS Cloudformation](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/Welcome.html)

[Sample Templates](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-sample-templates.html)

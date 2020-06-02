A Terraform configuration is a series of code blocks that define your intended infrastructure.

## View code

First, look the content of the `main.tf` file 

`cat main.tf`{{execute}}

You don't have to edit the code. It defines several resources: vpc, ec2 instance, elastic ip, keypair, etc. 

## Init

All Terraform workflows start with the `init` command. Terraform searches the configuration for both direct and indirect references to providers (such as Docker). Terraform then attempts to load the required plugins.

`terraform init`{{execute}}

## Validate and auto format

`terraform validate`{{execute}}

`terraform fmt`{{execute}}

## create a new workspace

`terraform workspace new prod`{{execute}}

A new workspace `prod` is created and switched

`terraform workspace list`{{execute}}

There is list of workspace names, a star (*) in front of `prod` workspace. 

## Dry run

`terraform plan`{{execute}}

Notice the resource name changed to `demo-prod`

## Apply

Now provision the webserver by running `apply`.

`terraform apply`{{execute}}

You will be asked to confirm. Type `yes` and press `ENTER`. It may take up to 30 seconds. A message will display confirmation that it succeeded.

## Verify

You can examine resource list.

Inspect Terraform state or plan

`terraform show`{{execute}}

`terraform state list`{{execute}}

Read an output from a state file

`terraform output`{{execute}}

Read state file

`find . |grep terraform.tfstate`{{execute}}

## Destroy

To remove the Nginx webserver as defined in `main.tf`, run the destroy command.

`terraform destroy`{{execute}}

You will be prompted to confirm. Type `yes` and press `ENTER`.

## Conclusion

You have now created and destroyed your first Terraform resources! Terraform supports hundreds of ecosystem providers, from major cloud resources to content delivery networks and more.

Continue learning at [Ahead Learn](https://www.katacoda.com/ahead) and the [Terraform API documentation](https://www.terraform.io/) or discuss with others on the [Terraform forum](https://discuss.hashicorp.com/c/terraform-core/27).

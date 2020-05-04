A Terraform configuration is a series of code blocks that define your intended infrastructure. You'll run the `terraform` command against this file to create an Nginx webserver and view the default Nginx web page.

## View code

First, look the content of the `main.tf` file 

`cat main.tf`{{execute}}

You don't have to edit the code. It defines two resources: vpc and ec2 instance

## Init

All Terraform workflows start with the `init` command. Terraform searches the configuration for both direct and indirect references to providers (such as Docker). Terraform then attempts to load the required plugins.

`terraform init`{{execute}}

## Apply

Now provision the webserver by running `apply`.

`terraform apply`{{execute}}

You will be asked to confirm. Type `yes` and press `ENTER`. It may take up to 30 seconds. A message will display confirmation that it succeeded.

## Verify

Visit this URL to view the default localstack web page which is now live:

- [Nginx index page](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/)

Alternatively, you can examine resource list.

Inspect Terraform state or plan

`terraform show`{{execute}}

`terraform state list`{{execute}}

Read an output from a state file

`terraform output`{{execute}}

Read state file

`cat terraform.tfstate`{{execute}}

## Destroy

To remove the Nginx webserver as defined in `main.tf`, run the destroy command.

`terraform destroy`{{execute}}

You will be prompted to confirm. Type `yes` and press `ENTER`.

## Conclusion

You have now created and destroyed your first Terraform resources! Terraform supports hundreds of ecosystem providers, from major cloud resources to content delivery networks and more.

Continue learning at [Ahead Learn](https://www.katacoda.com/ahead) and the [Terraform API documentation](https://www.terraform.io/) or discuss with others on the [Terraform forum](https://discuss.hashicorp.com/c/terraform-core/27).

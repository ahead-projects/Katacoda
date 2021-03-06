# Migrate State to Terraform Cloud

Finally, let's migrate the project to Terraform Cloud and execute the configuration remotely. The steps include:

- Run `init` on your local configuration
- Delete your local `terraform.tfstate` file
- Run `apply` to execute the configuration remotely
- Make further changes and run `apply` again

## Run `init`

First, run `init` to migrate the existing state to Terraform Cloud.

`terraform init`{{execute}}

You will be prompted to move state to Terraform Cloud.

## Delete local state

You may need to delete the local `terraform.tfstate` file to avoid warnings. State is now stored on Terraform Cloud so this file is no longer needed.

`rm terraform.tfstate`{{execute}}

## Run apply

Then, run `apply` to run the configuration in Terraform Cloud. This will also automatically create the `random-pet-demo` workspace on Terraform Cloud.

`terraform apply`{{execute}}

Because the existing state was copied to Terraform Cloud, and because no changes were made to the Terraform configuration code, no changes need to be provisioned at this time.

## Make changes

To see the effect of a remotely executed command, make a change to `main.tf`. Change the `stage` variable to `development` instead of `production`. This will trigger the creation of a new random pet name.

```
variable "stage" {
  default = "development"
}
```

Then, run `apply`:

`terraform apply`{{execute}}

As with a local Terraform run, you'll be asked to confirm. But this time, you'll be running the command in Terraform Cloud. The new random pet name is displayed as an output.

You can scroll up to find the URL to this run within your organization and workspace in Terraform Cloud.

Or, visit [Terraform Cloud](https://app.terraform.io/app) and select your organization. You'll see a workspace named `random-pet-demo`. Click the workspace to see that it has been run. You can examine the output from the run or view state, variables, or other settings.

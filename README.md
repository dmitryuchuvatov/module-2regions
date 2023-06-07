# Sample repo to create 1 module, use module twice and set modules in different regions

This specific example creates 2 EC2 instances in 2 different regions

## Prerequisites

Install and configure Terraform as per [official documentation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

[AWS credentials](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)

# How To

## Clone repository

```
git clone https://github.com/dmitryuchuvatov/module-2regions.git
```

## Change folder

```
cd module-2regions
```

## Initialize Terraform

```
terraform init
```

You should see the following output:

```
Initializing the backend...
Initializing modules...
- server1 in module
- server2 in module

Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 4.0"...
- Installing hashicorp/aws v4.67.0...
- Installed hashicorp/aws v4.67.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

## Run Terraform Apply

```
terraform apply
```
When prompted, type **yes** and hit **Enter**:

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

...
...
...

Plan: 2 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

module.server2.aws_instance.server: Creating...
module.server1.aws_instance.server: Creating...
module.server2.aws_instance.server: Still creating... [10s elapsed]
module.server1.aws_instance.server: Still creating... [10s elapsed]
module.server2.aws_instance.server: Still creating... [20s elapsed]
module.server1.aws_instance.server: Still creating... [20s elapsed]
module.server2.aws_instance.server: Still creating... [30s elapsed]
module.server1.aws_instance.server: Still creating... [30s elapsed]
module.server2.aws_instance.server: Creation complete after 32s [id=i-08c16773559c5df62]
module.server1.aws_instance.server: Creation complete after 32s [id=i-0fac707b0be0e4da2]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

## Clean up

```
terraform destroy
```

When prompted, type **yes** and hit **Enter**:

```
module.server1.aws_instance.server: Refreshing state... [id=i-0fac707b0be0e4da2]
module.server2.aws_instance.server: Refreshing state... [id=i-08c16773559c5df62]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

...
...
...

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.server1.aws_instance.server: Destroying... [id=i-0fac707b0be0e4da2]
module.server2.aws_instance.server: Destroying... [id=i-08c16773559c5df62]
module.server1.aws_instance.server: Still destroying... [id=i-0fac707b0be0e4da2, 10s elapsed]
module.server2.aws_instance.server: Still destroying... [id=i-08c16773559c5df62, 10s elapsed]
module.server1.aws_instance.server: Still destroying... [id=i-0fac707b0be0e4da2, 20s elapsed]
module.server2.aws_instance.server: Still destroying... [id=i-08c16773559c5df62, 20s elapsed]
module.server1.aws_instance.server: Destruction complete after 30s
module.server2.aws_instance.server: Destruction complete after 30s

Destroy complete! Resources: 2 destroyed.
```

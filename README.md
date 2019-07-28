# Minecraft: The Overengineered And Unfinished Edition

Because dang I really didn't have enough work to do at work.

### Getting started

Made to work with a fresh Ubuntu Linux install.  If you have an aws account and keys already made, run scripts/install.sh and configure your local aws profile.  Then run `terraform init && terraform apply` in the terraform folder.

If you don't have an existing AWS account, you need to create one and create an IAM user for yourself.  Then never, ever, ever log into your root account again. Otherwise some guy starts mining bitcoin in korea and you're down a couple thousand bucks.  Bury the password in your backyard or something.  Just for emergencies.  Speaking from experience here.

An s3 bucket needs to exist for the terraform remote state.  I named mine minecraft-terraform.  I dont think the bucket name can be repeated in a region for all accounts, so you'd probably need to update terraform/provider.tf with your own bucket name or change the region.  Protip - prepend your account id to your bucket name.

### The part with the pictures that tell you what all the things to and stuff
##### artifctuecture I think it's called.
###### yup

TODO


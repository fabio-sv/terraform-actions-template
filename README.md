# Terraform with Github Actions

This serves as a base template for using Terraform with Github actions

### The flow:

1. Make changes to your TF module locally
2. Checkout a new branch
3. Commit your changes and push the new branch
4. Open a PR
5. Wait for status checks to pass
6. Observe that once the status checks have passed, your (tf) plan is commented onto your PR. Neat.
7. Merge your PR
8. Observe that another Action has been kicked off to (tf) apply those changes
9. Once action completed successfully, visit the AWS console to see your changes

###### Note that this template is built around Terraform for AWS with S3 as a backend, and can be adapted for other providers and backend types

name = "Terraform"

on = {
  push = {}
}

env = {
  AWS_ACCESS_KEY_ID     = "${{ secrets.ACCESS_KEY }}"
  AWS_SECRET_ACCESS_KEY = "${{ secrets.SECRET_KEY }}"
}

jobs = {
  terraform = {
    runs-on = "ubuntu-latest"
    
    steps = [
      {
        name = "Checkout"
        uses = "actions/checkout@v2"
      },
      {
        name = "Setup Terraform"
        uses = "hashicorp/setup-terraform@v1"
        with = {
          terraform_version = "1.1.9"
        }
      },
      {
        name = "Terraform Init"
        run = "terraform init"
      },
      {
        name = "Terraform Validate"
        run = "terraform validate"
      },
      {
        name = "Terraform Format Check"
        run = "terraform fmt -check"
      },
      {
        name = "Terraform Plan"
        run = "terraform plan"
      }
    ]
  }
}

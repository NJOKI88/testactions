    - name=  "Terraform"
        on:  [push]
        env:
        AWS_ACCESS_KEY = "${{ secrets.SECRET_KEY }}"
        AWS_SECRET_ACCESS_KEY = "${{ secrets.SECRET_KEY }}"

 jobs:
        terraform:
          runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkoutv3
      - name: Setup terraform
        uses: hashicorp/setup-terraformv2
        with:
          terraform_version: 1.1.9
      - name: terraform init
        run:  terraform init        
      - name: validate
        run:  terraform validate
      - name: format
        run:  terraform fmt -check
      - name: plan
        run:  terraform plan 
      - name: terraform apply
      - name: apply auto-approve
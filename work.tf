name= Terraform

on= [push]
  
 # branches:
     # main  Change this to your desired branch
jobs=
  terraform=
    runs-on= ubuntu-latest

    env=
        AWS_ACCESS_KEY = "${{ secrets.SECRET_KEY }}"
        AWS_SECRET_ACCESS_KEY = "${{ secrets.SECRET_KEY }}"

    
    steps=
      - name: Checkout
        uses: actions/checkoutv3
      
      - name: Setup Terraform
        uses: hashicorp/setup-terraformv2
        with:
          terraform_version: 1.1.9
      
      - name: Terraform Init
        run: terraform init
      
      - name: Terraform Validate
        run: terraform validate
      
      - name: Terraform Format Check
        run: terraform fmt -check
      
      - name: Terraform Plan
        run: terraform plan
      - name: Terraform apply
        run: terraform apply auto-approve


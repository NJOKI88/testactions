name=  "Terraform"

on=  [push]

 env= "key"{
 }
 
     AWS_ACCESS_KEY_ID= $ {{ secrets.ACCESS_KEY}}
     AWS_SECRET_KEY_ID= $ {{secrets.SECRET_KEY}}
  
jobs=
  terraform=
    runs-on=  ubuntu-latest
    steps=
      - name= Checkout
        uses= actions/checkoutv3
      - name= Setup terraform
        uses= hashicorp/setup-terraformv2
        with=
          terraform_version: 1.1.9
      - name= terraform init
        run= terraform init        
      - name= validate
        run= terraform validate
      - name= format
        run= terraform fmt -check
      - name= plan
        run=  terraform plan




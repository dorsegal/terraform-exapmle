# terraform


This terraoform creates the following:
* VPC with two public and private subnets
* Route tables for each subnet
* Security Group to allow port 80 and 443
* ELB and ALB
* Private route53 hosted zone and CNAME entry for both ALB and ELB
* IAM Policy for this assignment


## Usage

`variables.tf` holds variables for vpc, subnets and aws cerds.

### Plan

```
terraform plan
```

### Apply

```
terraform apply 
```

### Destroy

```
terraform destroy 
```


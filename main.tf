provider "aws" {
  region = "ap-south-1"
}
 
module "Vms_app1" {
  #source = "./module/ec2-instance"
  source = "git::https://github.com/raneeyclai/tf-aws-module-jan26.git//ec2-instance?ref=main"
  region-1 = "ap-south-1"
  instance_type = "t3.micro"
  subnets = ["subnet-0a413d769fe98ba0b", "subnet-043f1f8151b681cca", "subnet-04f47a3252bdf06e6"]
  num_of_vm = 1
  env = "dev"
  web_sg = [module.Web_SG01.web_sg_id]
  user_data = file("scripts/nginx.sh")

}
 
output "vm_private_ips01" {
  value = module.Vms_app1.vm_priv_pips
}

module "Web_SG01" {
  source = "git::https://github.com/raneeyclai/tf-aws-module-jan26.git//security_groups?ref=main"
  project = "Ranee"
  vpc_id = data.aws_vpc.default.id
}
 
data "aws_vpc" "default" {
  default = true
}


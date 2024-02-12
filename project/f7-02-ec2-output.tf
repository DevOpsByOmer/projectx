

//public bstionHost instances Outputs
output "public_bs_instance_id" {
  value = module.ec2_public.id

}
output "public_bs__instance_ip" {
  description = "The public IP address assigned to the instance, if applicable"
  value       = module.ec2_public.public_ip
}
output "public_bs__instance_dns" {

  value = module.ec2_public.public_dns

}





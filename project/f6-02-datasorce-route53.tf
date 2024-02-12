data "aws_route53_zone" "mydomain" {
  name = "shoevilla.shop"

}


output "aws_route53_zone_id" {
  value = data.aws_route53_zone.mydomain.zone_id

}
output "mydomain_name" {
  description = " The Hosted Zone name of the desired Hosted Zone."
  value       = data.aws_route53_zone.mydomain.name
}
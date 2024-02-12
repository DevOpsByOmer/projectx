module "acm" {
  source      = "terraform-aws-modules/acm/aws"
  version     = "4.3.2"
  domain_name = data.aws_route53_zone.mydomain.name
  zone_id     = data.aws_route53_zone.mydomain.zone_id

  subject_alternative_names = [
    "*.shoevilla.shop",
  ]

  wait_for_validation = true

  tags = local.common_tags
}
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name               = "${local.name}-Alb"
  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  security_groups = [module.Loadbalancer_security_group.security_group_id]
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1],
  ]

  //listiner
  http_tcp_listeners = [
    # Forward action is default, either when defined or undefined
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
      action_type        = "redirect"
      redirect = {
        port        = 443
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]
  //Target group=1 app1
  target_groups = [
    {
      name_prefix                       = "app1-"
      backend_protocol                  = "HTTP"
      backend_port                      = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      //app1 targets
      #  targets = {
      #   my_app1_vm1 = {
      #     target_id = module.ec2_private_app1[0].id
      #     port      = 80
      #   },
      #   my_app1_vm2 = {
      #     target_id =module.ec2_private_app1[1].id
      #     port      = 80
      #   }
      # }
      tags = local.common_tags
    },
  ]

  https_listeners = [
    // Https listener index=0 for https 443
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = module.acm.acm_certificate_arn
      # target_group_index = 1
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed message for root message"
        status_code  = "200"
      }
    }
  ]

  https_listener_rules = [
    {
      # Rule-1: /app1* should go to App1 EC2 Instances
      https_listener_index = 0
      priority             = 1
      actions = [{
        type               = "forward"
        target_group_index = 0
      }]
      conditions = [{
        path_patterns = ["/*"]
      }]
    },

  ]
  tags = local.common_tags

} 
//rull resource

resource "null_resource" "null" {
  depends_on = [module.ec2_public]
  connection {
    host        = aws_eip.bastion_eip.public_ip
    password    = ""
    user        = "ec2-user"
    type        = "ssh"
    private_key = file("private-key/3tier-web-app.pem")
  }
  //file provisioner

  provisioner "file" {
    source      = "private-key/3tier-web-app.pem"
    destination = "/tmp/3tier-web-app.pem"
  }
  // remote provisioner
  provisioner "remote-exec" {
    inline = ["sudo chmod 400 /tmp/3tier-web-app.pem"]
  }
  //local exe provisioner
  provisioner "local-exec" {
    command     = "echo VPC created on $(date) and vpc ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exe-output-files/"
    interpreter = ["bash", "-c"]
  }
}
//local exe provisioner
# provisioner "local-exec" {
#   command="echo VPC destroy time prov 'date' >> destroy-time-prov.txt"
# working_dir = "local-exe-output-files/"
# when = destroy
//on_failure = continue
//creation time provisioners - By default they are creation time provisioners 
//destroy time provisioners


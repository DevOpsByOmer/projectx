#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start  
echo '<h1>Welcome to terraform infra-2 - APP-2</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app2
echo '<!DOCTYPE html> <html> <body style="background-color:rgb(15, 232, 192);"> <h1>Welcome to terraform infra-2 - APP-2</h1> <p>Terraform Demo</p> <p>Application Version: V2</p> </body></html>' | sudo tee /var/www/html/app2/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app2/metadata.html

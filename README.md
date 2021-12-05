# ELK stack on GCP with ansible
Installation for ELK stack on GCP with ansible

### Dependencies
- Terraform
- Ansible 2.9.x
- GCP Account

### Infra provisioning
Create a JSON Key for GCP account and put inside infra/ folder
Add name of GCP project and JSON key in infra/main.tf
Choose number of instances and put your ssh-key.

```
cd infra/
terraform init
terraform plan
terraform apply
```
### Running ELK installation
Enter IP addresses in install-elasticsearch/playbook.yml and install-elasticsearch/hosts,
feel free to add custom ssh-users and ssh-ports
```
cd install-elasticsearch/
ansible-playbook -i hosts playbook.yml
```

.PHONY: config update plan

config:
	@echo "Configuring remote backend"
	sh ./init

update:
	terraform get --update

plan:
	@echo plan
	@echo "********************************************************************"
	@echo "********************************************************************"
	@echo "     You must run a 'make apply' in order to deploy this plan"
	@echo "********************************************************************"
	@echo "********************************************************************"
	terraform get --update
	terraform plan  -out terraform.tfplan -var-file="terraform.tfvars"

destroy:
	@echo "********************************************************************"
	@echo "********************************************************************"
	@echo "    THIS WILL DESTROY YOUR VPC. YOU HAVE 10 SECONDS TO CTRL-C"
	@echo "********************************************************************"
	@echo "********************************************************************"
	@echo
	@sleep 10
	terraform plan -destroy -out terraform.tfplan -var-file="terraform.tfvars"
	terraform apply terraform.tfplan

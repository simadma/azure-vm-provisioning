TERRAFORM_DIR := terraform
ANSIBLE_DIR := ansible
PYTHON_INTERPRETER := "/usr/bin/python3.12"

.PHONY: all init apply provision fetch_outputs destroy


all: init apply provision


init:
	terraform -chdir=$(TERRAFORM_DIR) init


apply:
	terraform -chdir=$(TERRAFORM_DIR) apply


provision: fetch_outputs
	@# Generate inventory file
	@echo "[myhosts]" > "$(ANSIBLE_DIR)/inventory.ini"
	@echo "$(PUBLIC_IP) ansible_python_interpreter=$(PYTHON_INTERPRETER)" \
	  >> "$(ANSIBLE_DIR)/inventory.ini"

	@# Run ansible playbook
	ansible-playbook \
	  -i "$(ANSIBLE_DIR)/inventory.ini" \
	  --private-key "$(SSH_KEY_PATH)" \
	  -u "$(REMOTE_USER)" \
	  "$(ANSIBLE_DIR)/playbook.yaml"


fetch_outputs:
	@# Fetch outputs and set the variables
	@echo "Fetching Terraform outputs..."
	$(eval SSH_KEY_PATH := $(shell \
	  terraform -chdir=$(TERRAFORM_DIR) output -raw private_key_path \
	))
	$(eval REMOTE_USER := $(shell \
	  terraform -chdir=$(TERRAFORM_DIR) output -raw remote_user \
	))
	$(eval PUBLIC_IP := $(shell \
	  terraform -chdir=$(TERRAFORM_DIR) output -raw public_ip_address \
	))

	@# if any of the environment variables are empty, exit
	@test -n "$(SSH_KEY_PATH)" || { echo "Failed to fetch SSH key path"; exit 1; }
	@test -n "$(REMOTE_USER)" || { echo "Failed to fetch remote user"; exit 1; }
	@test -n "$(PUBLIC_IP)" || { echo "Failed to fetch public IP"; exit 1; }


destroy:
	terraform -chdir=$(TERRAFORM_DIR) destroy


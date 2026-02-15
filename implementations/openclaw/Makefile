# Agentic Stack Makefile
# The unified interface for deploying and managing the stack.

.PHONY: help setup install up down logs update backup shell-claw

# Default target
help:
	@echo "Agentic Stack Manager"
	@echo "====================="
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo "  setup        Run the one-time host hardening script (Root required)"
	@echo "  install      Build containers and start the stack for the first time"
	@echo "  up           Start services (detached)"
	@echo "  down         Stop services"
	@echo "  logs         Tail logs for all services"
	@echo "  update       Pull git changes, rebuild images, and restart stack"
	@echo "  backup       Trigger a manual backup of databases"
	@echo "  shell-claw   Open a shell inside the OpenClaw container"

setup:
	@echo "Running Host Setup & Hardening..."
	@chmod +x host/setup.sh
	@sudo ./host/setup.sh

install:
	@if [ ! -f .env ]; then \
		echo "Error: .env file not found. Please copy .env.example to .env and configure it."; \
		exit 1; \
	fi
	@echo "Creating volume directories and setting permissions (UID 1000)..."
	@# Prevent "Permissions Hell" where root creates volumes that container (node) can't write to.
	@mkdir -p services/postgres/data services/n8n/data services/openclaw/data services/clawsocial/sessions services/clawsocial/data services/traefik/acme
	@# We use 'sudo' because chown requires root. The user running 'make install' might not be root.
	@sudo chown -R 1000:1000 services/openclaw/data services/n8n/data services/clawsocial/sessions services/clawsocial/data
	@echo "Building and Starting Agentic Stack..."
	@docker compose up -d --build --remove-orphans
	@echo "Stack is running!"

up:
	@docker compose up -d

down:
	@docker compose down

logs:
	@docker compose logs -f

update:
	@echo "Updating Agentic Stack..."
	@git pull
	@docker compose build --pull
	@docker compose up -d --remove-orphans
	@echo "Update complete."

backup:
	@echo "Starting Backup..."
	@chmod +x scripts/backup.sh
	@./scripts/backup.sh

shell-claw:
	@docker compose exec openclaw bash

# Emergency: Wipe all agent memory/sessions (Preserves config)
nuke:
	@echo "WARNING: This will wipe all active sessions and short-term memory."
	@read -p "Are you sure? [y/N] " ans && [ $${ans:-N} = y ]
	@docker compose exec openclaw rm -rf /home/node/.openclaw/agents/*/sessions/*
	@echo "Nuked."

up:
	docker-compose up --build -d

down:
	docker-compose down

logs:
	docker-compose logs -f

setup:
	ansible-playbook setup.yml

secrets:
	cat backend/vault_credentials.env | grep VAULT_ROLE_ID | cut -d'=' -f2 > vault_role_id
	cat backend/vault_credentials.env | grep VAULT_SECRET_ID | cut -d'=' -f2 > vault_secret_id
	docker secret create vault_role_id vault_role_id || true
	docker secret create vault_secret_id vault_secret_id || true
	rm vault_role_id vault_secret_id
	
test:
	curl -s http://backend.localhost:8443/api/health | jq .
	curl -s -X POST http://backend.localhost:8443/api/users \
		-H "Content-Type: application/json" \
		-d '{"username": "testuser", "email": "test@example.com"}' | jq .
	curl -s http://backend.localhost:8443/api/users | jq .

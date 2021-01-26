
all: deps lint test-deploy

deps:
	python -m pip install -U pip setuptools
	pip install ansible
	printf '[defaults]\nroles_path=../' > ansible.cfg
	# ansible-galaxy install indigo-dc.docker

lint: deps
	ansible-playbook tests/test.yml -i tests/inventory --syntax-check

test-deploy: deps
	ansible-playbook tests/test.yml -i tests/inventory
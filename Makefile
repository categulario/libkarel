.PHONY: test lint pytest mypy kareltest

test: pytest lint mypy kareltest

lint:
	python3 -m flake8 --exclude=.env,.tox,dist,docs,build,*.egg --ignore=E501,W503 .

mypy:
	python3 -m mypy --strict .

pytest:
	python3 -m pytest -xvv

kareltest:
	cd tests && \
	RESULT="$$(PYTHONPATH="${PWD}" python3 kareltest_test.py kareltest)" && \
	if [ "$${RESULT}" -ne 1 ]; then \
		echo "Expected result to be 1, got '$${RESULT}'"; \
		exit 1; \
	fi

build-html:
	git --no-pager tag | tail -n 1 | xargs -I % poetry version %
	poetry version --short > src/_version
	mkdocs build --clean --site-dir html

build-pdf:
	git --no-pager tag | tail -n 1 | xargs -I % poetry version %
	poetry version --short > src/_version

create-dev:
	pre-commit install
	pre-commit autoupdate
	rm -rf env
	python3.10 -m venv env
	( \
		. env/bin/activate; \
		pip install -r requirements.txt; \
		poetry install; \
		deactivate; \
	)

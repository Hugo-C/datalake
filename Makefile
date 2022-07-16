build_release:
	python3 setup.py sdist bdist_wheel
clean:
	@rm -rf dist/
	@echo "Removed dist folder"
test:
	@pytest $$path
doc:
    portray as_html -o github_pages/ --overwrite -m datalake
deploy_test: clean build_release
	python3 -m twine upload --repository testpypi dist/*
deploy_prod: clean build_release
	python3 -m twine upload dist/*

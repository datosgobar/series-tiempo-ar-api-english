SHELL = bash

.PHONY: docs servedocs doctoc

servedocs:
	mkdocs serve

mkdocsdocs:
	mkdocs build
	rsync -vau --remove-source-files site/ docs/
	rm -rf site

serveswaggerdocs:
	echo "Browse to http://localhost:8000/docs/swagger/"
	python -m SimpleHTTPServer 8000

swaggerdocs:
	wget https://github.com/swagger-api/swagger-ui/archive/master.zip -O temp.zip; unzip -jo temp.zip 'swagger-ui-master/dist/*' -d docs/open_api/; rm temp.zip
	sed -i.bak "s/url: \".*\"/url: \"\.\/swagger\.yml\", validatorUrl: null/g" docs/open_api/index.html
	echo ".download-url-wrapper { display: none!important; }" >> docs/open_api/swagger-ui.css
	rm -f docs/open_api/index.html.bak

docs: mkdocsdocs swaggerdocs

doctoc: ## generate table of contents, doctoc command line tool required
        ## https://github.com/thlorenz/doctoc
	doctoc --github --title " " docs/quick_start.md
	bash fix_github_links.sh docs/quick_start.md
	doctoc --github --title " " docs/additional_parameters.md
	bash fix_github_links.sh docs/additional_parameters.md
	doctoc --github --title " " docs/reference/api_reference.md
	bash fix_github_links.sh docs/reference/api_reference.md
	doctoc --github --title " " docs/reference/search_reference.md
	bash fix_github_links.sh docs/reference/search_reference.md
	doctoc --github --title " " docs/spreadsheet_integration.md
	bash fix_github_links.sh docs/spreadsheet_integration.md
	doctoc --github --title " " docs/python_usage.md
	bash fix_github_links.sh docs/python_usage.md

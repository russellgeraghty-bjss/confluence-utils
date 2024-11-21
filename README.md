# Useful Confluence scripts

## Installation
```shell
make setup
```

## Labelling
This adds labels to all the pages beneath a given page. Its very simple:
* Copy .env.example to .env
* Read the instructions in there and create your Atlassian token
* Find the parent page in Confluence and note the URL, e.g. https://acme-corp.atlassian.net/wiki/spaces/ACME/pages/484999255/Architecture?atl_f=PAGETREE
* Grab the number out of there: 484999255
* Edit `.env` and add your label and parent page
* Run:
```shell
make label
```
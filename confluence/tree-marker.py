import os

import requests
from dotenv import load_dotenv

# Confluence credentials and URL
load_dotenv()

USERNAME = os.getenv("USERNAME")
API_TOKEN = os.getenv("API_TOKEN")
BASE_URL = os.getenv("BASE_URL")
PARENT_PAGE_ID = os.getenv("PARENT_PAGE_ID")
LABEL = os.getenv("LABEL")

# Get child pages
response = requests.get(
    f"{BASE_URL}/content/{PARENT_PAGE_ID}/child/page",
    auth=(USERNAME, API_TOKEN)
)
child_pages = response.json()["results"]

# Add label to each child page
for page in child_pages:
    page_id = page["id"]
    payload = {"prefix": "global", "name": LABEL}
    requests.post(
        f"{BASE_URL}/content/{page_id}/label",
        json=payload,
        auth=(USERNAME, API_TOKEN)
    )
    print(f"Label '{LABEL}' added to page {page['title']}")

if __name__ == '__main__':
    pass
# anomaly_detector
Design an anomaly detector that operates without predefined labels, ingesting multi-modal data - specifically images and text - and identifying outliers as it learns.


# Structure
anomaly_detector/
├── app/
│   ├── main.py              # FastAPI backend
│   ├── requirements.txt     # Python dependencies
│   └── static/
│       ├── index.html       # Frontend HTML
│       ├── style.css        # Frontend CSS
│       └── script.js        # Frontend JavaScript
├── Dockerfile               # Docker configuration for Cloud Run
├── Makefile                 # Commands for building and deploying
└── .gitignore               # Git ignore file

# setup
curl https://sdk.cloud.google.com | bash
gcloud init

gcloud auth login
gcloud config set project your-gcp-project-id

# manual steps
Cloud Storage: Create a bucket (your-bucket-name) and update main.py with its name.
BigQuery: Manually create a dataset and table (e.g., your_project.your_dataset.your_table) with columns: image_path (STRING), text (STRING), score (FLOAT), label (STRING).
Cloud Functions: Write and deploy functions to extract features (e.g., triggered by Storage uploads), updating main.py to call them if needed.
GCP Credentials: Set up a service account, download the JSON key, and configure it in Cloud Run environment variables (e.g., GOOGLE_APPLICATION_CREDENTIALS).

# run
Update Makefile with your PROJECT_ID, SERVICE_NAME, and REGION.
Run in Codespaces:

make all
make build
make run
# 
# Variables (replace with your values)
PROJECT_ID = your-gcp-project-id
SERVICE_NAME = anomaly-detector
REGION = us-central1

# Build Docker image
build:
	docker build -t gcr.io/$(PROJECT_ID)/$(SERVICE_NAME) .

# Push to Google Container Registry
push:
	docker push gcr.io/$(PROJECT_ID)/$(SERVICE_NAME)

# Deploy to Cloud Run
deploy:
	gcloud run deploy $(SERVICE_NAME) \
		--image gcr.io/$(PROJECT_ID)/$(SERVICE_NAME) \
		--platform managed \
		--region $(REGION) \
		--allow-unauthenticated

# Run locally for testing
run:
	docker run -p 8000:8000 gcr.io/$(PROJECT_ID)/$(SERVICE_NAME)

# Full deploy pipeline
all: build push deploy
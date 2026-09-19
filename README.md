# Brain Tasks App — EKS CI/CD Deployment

## Overview
Deployed the Brain Tasks App to AWS EKS with a full CI/CD pipeline using CodeBuild and CodePipeline.

## Architecture
GitHub → CodeBuild → ECR → CodePipeline → EKS → LoadBalancer

## Tech Stack
AWS EKS · ECR · CodeBuild · CodePipeline · CloudWatch · Docker · Kubernetes · eksctl · kubectl

## Application URL
http://ae93564c0c643470fb5669e43984ddb7-b45576c39843ad44.elb.us-east-1.amazonaws.com

## LoadBalancer ARN
arn:aws:elasticloadbalancing:us-east-1:401466818325:loadbalancer/net/ae93564c0c643470fb5669e43984ddb7/b45576c39843ad44

## Deployment Steps

1. **App setup** — cloned the pre-built React/Vite app
2. **Dockerized** — `Dockerfile` uses `nginx:alpine`, listens on port 3000
3. **ECR** — pushed image to `401466818325.dkr.ecr.us-east-1.amazonaws.com/brain-tasks-app:v1`
4. **EKS** — created `brain-tasks-cluster` (K8s v1.33, us-east-1)
5. **K8s manifests** — `k8s-deployment.yaml` (2 replicas) + `k8s-service.yaml` (LoadBalancer)
6. **CodeBuild** — builds & pushes Docker image via `buildspec.yml`
7. **CodePipeline** — GitHub → CodeBuild → EKS
8. **CloudWatch Logs** — captures build and deploy logs

## Files
- `Dockerfile` — container image definition
- `buildspec.yml` — CodeBuild build instructions
- `k8s-deployment.yaml` — Kubernetes Deployment
- `k8s-service.yaml` — Kubernetes LoadBalancer Service
- `dist/` — static app files
- `screenshots/` — proof of deployment

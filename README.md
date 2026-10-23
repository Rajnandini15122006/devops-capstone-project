# DevOps Capstone Project

[![CI Build](https://github.com/Rajnandini15122006/devops-capstone-project/actions/workflows/ci-build.yaml/badge.svg)](https://github.com/Rajnandini15122006/devops-capstone-project/actions/workflows/ci-build.yaml)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Python 3.9](https://img.shields.io/badge/Python-3.9-green.svg)](https://shields.io/)

This repository contains the completed capstone project for [**IBM-CD0285EN-SkillsNetwork DevOps Capstone Project**](https://www.coursera.org/learn/devops-capstone-project?specialization=devops-and-software-engineering) as part of the [**IBM DevOps and Software Engineering Professional Certificate**](https://www.coursera.org/professional-certificates/devops-and-software-engineering).

## Project Overview

The objective of this capstone project is to develop, test, secure, containerize, and continuously deploy a production-grade **Account RESTful Microservice** for an e-commerce platform using Agile methodologies, Test-Driven Development (TDD), Behavior-Driven Development (BDD), Docker containerization, Kubernetes orchestration, and Tekton Continuous Delivery (CD) pipelines.

## Microservice Architecture & Capabilities

- **Agile Sprint Planning**: User stories, backlog management, and Kanban workflows tracked across 3 sprint iterations.
- **RESTful API Service**:
  - `POST /accounts`: Create a new customer account
  - `GET /accounts`: List all customer accounts
  - `GET /accounts/{id}`: Read/retrieve specific customer account details
  - `PUT /accounts/{id}`: Update an existing customer account
  - `DELETE /accounts/{id}`: Delete an account from the service
  - `GET /health`: Health check endpoint
- **Security & Hardening**:
  - **Flask-Talisman**: Configured with Content Security Policy (CSP), X-Frame-Options, X-Content-Type-Options, and Referrer-Policy headers.
  - **Flask-CORS**: Configured cross-origin resource sharing policies.
- **Continuous Integration (CI)**:
  - GitHub Actions workflow running automated Flake8 linting and Nosetests with >95% code coverage.
- **Containerization**:
  - Production-ready `Dockerfile` running Python 3.9-slim with an unprivileged non-root user (`theia`) on port `8080`.
- **Kubernetes Deployment**:
  - Declarative manifests for Deployment, Pods, ReplicaSets, and Services (`deploy/deployment.yaml`, `deploy/service.yaml`).
- **Continuous Delivery (CD)**:
  - Cloud-native Tekton pipeline (`tekton/pipeline.yaml`, `tekton/tasks.yaml`) orchestrating clone, lint, test, container image build, and automated Kubernetes/OpenShift deployment.

## Local Development & Testing

Activate environment and install dependencies:
```bash
source bin/setup.sh
pip install -r requirements.txt
```

Run code linter:
```bash
flake8 service tests --count --max-complexity=10 --max-line-length=127 --statistics
```

Run unit tests and coverage report:
```bash
nosetests -v --with-spec --spec-color --with-coverage --cover-package=service
```

Run microservice locally:
```bash
gunicorn --bind=0.0.0.0:8080 --log-level=info service:app
```

## Repository Structure
- `.github/workflows/ci-build.yaml` - GitHub Actions CI automation workflow
- `service/` - Microservice application core, models, error handlers, and REST API routes
- `tests/` - Test suite for models, REST routes, and security policies
- `deploy/` - Kubernetes manifests (Deployment and Service)
- `tekton/` - Tekton CD pipeline and task manifests
- `Dockerfile` - Container specification
- `setup.cfg` - Nose, coverage, Flake8, and Pylint configuration
- `user-story.md` - Agile user story definitions and acceptance criteria

## Author
Rajnandini (rajnandini15122006@gmail.com)

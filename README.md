# Servian Techchallenge

## Overview

This modularised terraform template will deploy the servian techchallenge app in AWS using ECS with a Postgres RDS DB(v10.7) backend with AWS CloudMap as service discovery.

Notes
- DB connections vars are automatically mapped upon module initialisation. Please check modules/ecs_task.tf
- Upstream react application that needs to connect to the techchallenge app must be allowed in the via the allowed_sg variable.
- Template assumes that there is already an ECS cluster and Service Discovery deployed in the AWS Account.

## Usage

```terraform init
terraform apply -var="release_version=latest" -var="allowed_sg=sg-123456"
```
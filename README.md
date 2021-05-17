# Aws ecs-cli action

This action allows you to run an ecs service using docker-compose 
> This action is under development

## Inputs

### `cluster`:

**Required** The name of the cluster

### `region`:

**Required** The name of the region

### `project`:

**Required** The name of the project

## Outputs

### No output yet

## Example usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Configure AWS credentials.
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: eu-central-1
      - name: Checkout code
        uses: actions/checkout@v2
        
      - name: Deploy to Amazon ECS
        uses: hsalem7/ecs-cli@v1
        with:
          region: eu-central-1
          cluster: Cluster1
          project: MyProject
```

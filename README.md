# Add Pub/Sub Dashboard Grafana

## Prerequisite

1. Stackdriver Datasource Added in Grafana
2. Grafana endpoint URL & Port number. (default is 3000)
3. Username & Password for admin access.
4. Pubsub Topic & subscriptions setuped.

## Setup Authentication

1. export environment variable for authentication

```bash
export GRAFANA_AUTH="admin_username:admin_password"
```
2. Add Grafana URL & port in [main.tf](./main.tf) file 

```
provider "grafana" {
  url  = "http://your-grafana-url:port"
}
```

## Add Prometheus Datasources

### Step 1

1. Open [terraform.auto.tfvars](./terraform.auto.tfvars) file.
2. Add users emails to give them access of edit

```hcl
users = ["rahul.soni@knoldus.com","rahul989741@gmail.com"]
team = "DevOps"
```

### Step 2

1. Install provider plugins

```
terraform init
```

2. Check Terraform plan

```
terraform plan
```

3. Apply the terraform configurations

```
terraform apply
```

# Final Step

Add missing variables if any in grafana dashboard direct from the dashboard.
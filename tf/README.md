How to use this, from the world-service repo just choose the scope of the deployment and then plan-all/apply-all, for example:

### To deploy EVERYTHING (all versions) in the us-east-2 region
```sh
cd tf/non-prod/us-east-2
terragrunt plan-all
```

### To deploy all of the dev services (v1 blue, v1 green, and v2 blue)
```sh
cd tf/non-prod/us-east-2/dev
terragrunt plan-all
```

### To deploy just v1 services (v1 blue and v1 green)
```sh
cd tf/non-prod/us-east-2/dev/v1
terragrunt plan-all
```

### Finally, to deploy just blue v1 in dev (only v1 blue)
```sh
cd tf/non-prod/us-east-2/dev/v1/blue
terragrunt plan
```

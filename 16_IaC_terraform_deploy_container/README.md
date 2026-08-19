# Deploy docker containers with Terraform

<a href="" target="_blank">
<img src="https://github.com/kokchun/assets/blob/main/terraform/.png?raw=true" alt="deploy BI dashboard" width="600">
</a>


## Deployment process

Terraform is used to setup and deploy the infrastructure with
- azure container registry 
- azure container app
- azure app services 

Then we create a bash script called deploy_infra.sh that will orchestrate the infrastructure deployment as well as building and pushing images to azure container registry. Afterwards comes final manual steps to connect container app to backend image and app services to frontend image. Also in frontend we need to add the environment variable `BACKEND_URL` manually. 

The idea with this setup is that infrastructure is deployed using terraform, then manual setup followed by eventual CI/CD using github actions which will enable deployment when pushing to github. 



Go into the [official documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest) to read about the different resources that we are creating
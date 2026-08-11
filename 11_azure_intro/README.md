# Introduction to Azure Cloud Platform

**part 1 - fundamental architecture**

<a href="https://youtu.be/eVBC8DiR8N0" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/azure/architecture.png?raw=true" alt="azure fundamental architecture" width="600">
</a>

**part2 - Pricing models**

<a href="https://youtu.be/Zwfguhx8Ufc" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/azure/scaling.png?raw=true" alt="scaling and pricing" width="600">
</a>

## What does Azure provide?

As a cloud platform provider with big market shares, Azure is providing a wide range of IT services via internet, including servers, storage and networking etc. Compared to on-premises IT infrastructure, companies now share some of the responsibilities to set up and maintain its IT infrastructure with cloud platform provider as Azure. How much of the responsibilities are shared depends on whether an IT service is offered as IaaS, PaaS or SaaS. This way of categorizing IT services is called shared responsibility model:

- **Infrastructure as Service (IaaS)** <br>
  If you create a virtual machine in Azure, you are using IaaS because you are responsible for everything apart from handling the physical hardware. For example, you need to choose the operation system, install and patch all softwares necessary for your work.
- **Platform as a Service (PaaS)** <br>
  With PaaS, developers can skip caring about the servers behind and focus on developing applications on Azure's servers behind the scenes. Azure App Service is a PaaS example, where developers can deploy apps without managing the infrastructure.
- **Software as a Service (SaaS)** <br>
  With SaaS, users can use Azure's softwares online. Azure AI services are examples of SaaS available on Azure.

🔍 [Read more on Shared responsibility models](https://learn.microsoft.com/en-us/azure/security/fundamentals/shared-responsibility)

<details>
  <summary>🧠 <b>Knowledge check</b></summary>
  Suppose you have a MacBook and you want to spin up a Windows virtual machine to visit YouTube using the Chrome browser. What do you need to do?

- [ ] Find a secure physical room to store your Windows VM
- [ ] Create strong credentials for logging into your Window VM and keep the credentials securely
- [ ] Patch the Windows operating system regularly
- [ ] Install Google Chrome on the Windows VM
- [ ] Keep Chrome up to date (enable automatic updates)

</details>

<br>

> [!Tip]
> Follow exercise 0.1 to enhance your understanding of shared responsibility model

## How does Azure provide services?

Whenever you create an Azure resource, you often have to choose a region for this resource. So what are region and related geographical terms in Azure? And why are they related to how Azure is working as a cloud platform?

### Datacenters

The physical infrastructure of Azure are housed in buildings called datacenters. These datacenters store physical computer servers together with networking, power and cooling facilities. These facilities are arranged in racks. These physical infrastructure are providing IT services to Azure customers over internet.

**Datacenter racks** ⤵

<img src="https://github.com/kokchun/assets/blob/main/azure/rack.png?raw=true" alt="deata server racks" width="500">

### Regions

A region is a geographical area that is composed of one or multiple datacenters that are close to each others. When creating an Azure resource, we often need to choose from which region we would like the resource to be created. Then Azure internally assigns workloads across datacenters in the region to ensure balanced workloads.

🔍 [Checkout the map of all Azure regions (NOT datacenters!)](https://datacenters.microsoft.com/globe/explore?info=region_swedencentral)

### Availability zones

Some regions are further divided into availability zones. Each availability zone contains one or multiple datacenters. These availability zones are isolated with each others in the sense that when one goes down, another can continue working. This prevents downtime faced by customers.

> [!Note]
> Choice of region for an Azure resource is affected by many factors such as:
>
> - latency- Azure servers respond to end-users closer to a region
> - your availability target- regions with availability zones gurantee uptime to end-users

## How can you provision an IT service on Azure?

### Resource groups and resources

All IT services you pay for in Azure are called **resources**: virtual machines, databases, networking setups are all separate resources. Azure requires you to create a **resource group** to group created resources. With a good structure of resource groups and resources, one can manage resources more efficiently as one can, for example, grant access for or delete all resources within a resource group altogether.

### Subscriptions

Before creating resource groups and resources, you need to first create a **subscription** under your **account**. You can create multiple subscriptions under your accounts. Then, you can start creating resource groups and resources under different subscriptions.

Subscription serves as a unit of billing and administration. A good structure of subscription facilitates billing and other administration tasks. For instance, if a company is working with development and production environments, which means that there is an IT infrastructure supporting each environment, it can create DEV and PROD subscription to host resources used in each environment separately. There is no rule on how to organize your subscriptions. Some companies may want to create separate subscriptions for different departments instead, like sales, IT, logistics departments etc.

🔍 [More details on the hierarchy of account -> subscription -> resource group -> resource](https://learn.microsoft.com/en-us/training/modules/describe-core-architectural-components-of-azure/6-describe-azure-management-infrastructure?ns-enrollment-type=learningpath&ns-enrollment-id=learn.wwl.azure-fundamentals-describe-azure-architecture-services)

<details>
  <summary>🧠 <b>Knowledge check</b></summary>
  Create a resource, storage account-blob container
  
  - choose and create corresponding subscription, resource group. Follow also [naming conventions](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming) in Azure
  - which region should you choose?
  - how does the choose of [redundancy](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy) affect you?
  - upload a file as a blob to a container
  - how do you connect to this file on the cloud via python locally?

</details>

## Examples of Azure resources

One can build an IT infrastructure with different Azure resources, or combine them with IT services on-premises or provided by other cloud platforms. Below are some Azure resources serving different purposes in an IT infrastructure:

> [!Note]
> There are much more Azure resources serving other purposes, like networking. These will not be covered here.

### Computing services

Here're some commonly used computing services in Azure. You will be creating VM, Azure Web App and Azure Container Instance in this and following lectures, for hands-on experience to deepen your knowledge of them.

- Virtual machine (VM) <br>
  VM works similarly as a physical computer. You configure specifications like OS, CPU and RAM etc upon creating a VM resource. It can be used as a lift-and-shift cloud migration as a company does not need to change its existing IT infrastructure much if it only wants to move physical servers to virtual ones.
- Azure Web App <br>
  After you have locally developed a web application, you can deploy it to Azure App Service. Azure App Service provides the underlying servers to host your production web application as an Azure Web App, which is reachable by end-users online, i.e. users can use web browsers as clients to access the application over HTTP/HTTPS protocols.
- Azure Functions <br>
  It's cost efficient to deploy your codes to Azure Functions if you would only like to run your codes when certain events triggers. For example, if you receive an email etc. It avoids provisioning resources when there is no actual needs for them.
- Azure Container Instances <br>
  Azure Container Instances are used to spin up containerized applications. This is suitable when you have containerized applications requiring different operation systems.

🔍 [More on Azure compute services](https://learn.microsoft.com/en-us/training/modules/describe-azure-compute-networking-services/)

<details>
  <summary>🧠 <b>Knowledge check</b></summary>
  Can you explain these concepts intuitively during an interview for cloud data engineer?

- What does it mean by a short-lived and stateless containerized application?
- Can a containerized application persistently store data?
</details>

### Data stores

On Azure, one can store different types of data with different Azure resources.

- Azure Storage Account <br>
  Under an Azure Storage Account, one can create different types of storages including:
  - Azure Blob Storage <br>
    stores unstructured data such as text files, images and videos. Data stored in Azure Blob Storage are called blobs. The capacities of blobs can be extended to Azure Data Lake Storage which are optimized for big data analytics workloads <br>

    🔍 [Azure Data Lake Storage and Data Lakehouse Architecture](https://learn.microsoft.com/en-us/training/modules/introduction-to-azure-data-lake-storage/6-use-cases)

  - Azure File Share <br>
    can replace on-premises file servers to provide hierarchical file system. It can be mounted by physical servers as a shared drive and containerized applications for persistent storage.

- Azure SQL Database, Azure SQL Managed Instance & SQL Server on Azure VMs <br>
  are three separate resources in the Azure SQL family. One can choose one of them to host relational data depending on the preferred shared responsibility models: Azure SQL Database and Azure SQL Managed Instance are PaaS and SQL Server on Azure VMs is IaaS <br>
  🔍 [Azure SQL family provides IaaS and PaaS versions of SQL Server](https://learn.microsoft.com/en-us/azure/azure-sql/azure-sql-iaas-vs-paas-what-is-overview?view=azuresql) <br>
  🔍 [Azure SQL family products for non-relational data](https://learn.microsoft.com/en-us/azure/azure-sql/multi-model-features?view=azuresql)

> [!Tip]
> Follow exercise 0.1 to enhance your understanding of Azure SQL family

- Azure Cosmos DB <br> <!--variety of big data-->
  is an Azure's offering of NoSQL database. NoSQL databases receive growing popularity due to the rise of big data that involves more variety of data types. These data cannot be handled by a relational database as rows in tables. Azure Cosmos DB offers multiple database APIs to handle different types of non-relational data, allowing modelling of real world data using documents, key-value, graph and comlumn family data models. SQL is not used for queries. These data have their own programming lanaguages for query purpose. <br>
  🔍 [Non-relational data models](https://learn.microsoft.com/en-us/azure/architecture/data-guide/big-data/non-relational-data) <br>
  🔍 [NoSQL database](https://azure.microsoft.com/en-us/resources/cloud-computing-dictionary/what-is-nosql-database)

### Analytics

- Azure Databricks <br> <!--velocity of big data-->
  is an _unified_ data platform to combine distributed computing and storage optimal for big data analytics purposes.

## Monitoring cost

While cloud infrastructure generally has lower upfront cost, it is important to keep track of the usage-based cost by:

- estimating cost: <br>
  before creating a resource, you should estimate the cost based on configuration and estimated usage of a resource. The online [pricing calculator](https://azure.microsoft.com/en-us/pricing/calculator/) is useful for this purpose.
- understanding current cost: <br>
  after creating resources, you can track the incurred cost under a subscriptioin on Azure portal. On Azure portal, after selecting a subscription, you can analyze incurred cost by navigating to _cost management_ and cost analysis. You can then identify the most costly resources and find ways to cut cost.
- creating budget alerts: <br>
  in order to prevent unexpected high cost, you should create budget alerts to get notified when the incurred cost has exceeded an amount. you can create a budget alert for a subscription on Azure portal. After selecting a subscription, navigate to _cost management_ and _budgets_ to create a budget alert.

<details>
  <summary>🧠 <b>Knowledge check</b></summary>
  Try create a budget alert.
</details>

🔍 [Tutorials on create and manage budgets](https://learn.microsoft.com/en-us/azure/cost-management-billing/costs/tutorial-acm-create-budgets?tabs=psbudget)

## Monitoring performance

If you reply on Azure resources to build your business applications, it is essential to monitor performance of these Azure resources. Azure generates perfomance data for its resources, provides different tools to analyze these data and enables alerts to be triggered if certain conditions of the resources are detected through these data. Azure Monitor offers a collection of features for this purpose.

For example, if you are hosting a database server on an Azure VM and let users to query this database server, you need to track the CPU and memory comsumption of the VM. By analyzing this data, you can identify times of low performance and prevent possible downtime by scaling up the VM during peak period. Azure Monitor provides different monitoring features for different types of resources, such as computing and storage resources.

Some key features available in Azure Monitor include:

- Metrics <br>
  Metrics are data describing some aspects of the status of a resource at regular intervals. An example of metrics data is the available memory of a VM. They are collected automatically. On Azure portal, after selecting an existing resource, you can use Metrics Explorer to plot chats from metrics.
- Resource Logs <br>
  Resource logs are detailed data about the operation performed on a specific resource. For example, if you have a storage account container, you can collect logs on its delete, read and write operations. You need to create a diagnostic setting for a resource to collect log data and select where the data should be stored. On Azure portal, you can use Log Analytics to query and analyze the data.

- Alert <br>
  An alert rule is used to proactively detect issues of a resource. A rule can be fired when a certain condition is met in metric and log data. For example, if the CPU consumption of a VM reaches 70% of its capacity. Then, an action will be executed, like sending notification through emails.

<details>
  <summary>🧠 <b>Knowledge check</b></summary>
  Browse through the metrics and resource logs for the storage account that you have created in lecture 3.
</details>

🔍 [More on Azure Monitor Metrics](https://learn.microsoft.com/en-us/azure/azure-monitor/metrics/data-platform-metrics) <br>
🔍 [More on Azure Monitor Resource Logs](https://learn.microsoft.com/en-us/azure/azure-monitor/platform/resource-logs?tabs=log-analytics) <br>
🔍 [More Azure Monitor Alerts](https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-overview)

## Interacting with Azure

You can create and manage Azure resources in different ways:

- GUI
  - [Azure portal](http://portal.azure.com): a web-based graphical user interface to interact with your Azure environments, as an alternative to command-line tools (i.e. writing commands)
- Command line tools
  - Azure CLI: uses Bash commands
  - Azure PowerShell: uses PowerShell commands
  - both can be installed locally and run in local shells, or via Azure Cloud Shell which is a web-based shell tool

> [!Note]
> For example, if you want to delete a resource group, then you can either use Azure CLI command:
>
> ```
> az group delete -n RG01
> ```
>
> or Azure PowerShell command:
>
> ```
> Remove-AzResourceGroup -Name "RG01"
> ```

- Infrastructure as Code (IaC) <br>
  IaC refers to writing codes to define and deploy resources, making it possible to reproduce the same resources
  - Azure Resource Manager (ARM): Azure’s native service for deploying and managing resources using declarative syntax including:
    - ARM templates
    - Bicep files
  - Terraform: a popular third-party, multi-cloud CLI tool for IaC. Unlike ARM templates and Bicep files which are Azure-specific, Terraform can manage infrastructure across multiple cloud providers (Azure, AWS & GCP)

> [!Tip]
> Follow exercise 0.2 to explore interacting with Azure using Azure portal and create a resource group to include a VM as a resource. For subscription, you will be using the default subscription, _Azure for Students_, under your account.

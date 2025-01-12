#Project Task 2: Deploy and Configure Cloud Resources

### 1.  Argon Solutions have asked you to identify a list of tools they can use to help develop and automate their deployment of services in Azure Cloud.

**Visual studio Code**
**Azure Powershell**



### 2.  Outline the steps required to deploy Argon Solutions web server in Azure. Include all resources required to be configured in Azure.

| **Steps**             | **Description**                                                                                     |
|-----------------------|-----------------------------------------------------------------------------------------------------|
| Authentication to Azure | Successful authentication into Azure and environment properly configured to begin deployment.       |
| Creating a Resource Group | Creating a logical container for grouping the select Azure resources that will be deployed.         |
| Configure Network Security Group | Configure SSH and HTTP ports.                                                               |
| Creating Virtual Machines | Creating and configuring a virtual machine to meet Argon Solutions' requirements. Create a virtual machine with the resource group, name, admin account, location, virtual network, size, and image. |
| Testing Access to Network Services | Test SSH and HTTP connectivity.                                                             |



### 3.  Review the following two default templates,

a)  Create a Linux virtual machine
b)  Create a Windows virtual machine

**-   Determine which would be best suited to be used as part of Argon Solutions web development deployment.**

The operating system that would best suit Argon Solutions' web development deployment would be Linux.

**-   Provide a reason for your selection.**

One reason why it has been decided to use Linux is because Argon solutions would like to deploy an Ubuntu Server for this specific web development.

**-   Identify and list 4 dependencies required for this template.**

**The four dependencies required for this template are as follows:**

1\. Virtual network

2\. Network security group (NSG)

3\. Public IP Address

4\. Resource Group



### 4.  Develop a system test plan for cloud deployment and email to Manager for approval.

 | **Test Detail**         | **Expected Result**                          | **Actual Result**                          |
|-------------------------|----------------------------------------------|--------------------------------------------|
| Template has been deployed | Successful deployment                      |                                            |
| Custom template has been validated | Template has been validated successfully, and specifications for the template have been matched |                                            |
| Connect using SSH to the VM | Successfully maintain and create an SSH connection to the virtual machine |                                            |
| Validate and test parameters | No errors with testing parameters         |                                            |
| Virtual machine has been configured successfully | Successful creation and deployment of a virtual machine using scripts and templates. Parameters are adequately met, virtual machine running with public IP |                               

![Imgur](https://imgur.com/FPkQXxP.png)



### 5.  Edit the default template you selected above and create the virtual machine using Azure Resource Manager.

**The server should be configured with the following parameters:**

-   OS: Linux (ubuntu 18 or later)

-   Name: WebDev**"+StudentID"**

-   Dns Label Prefix: webdev**"+StudentID"**

-   Size: Standard B1s

-   Admin Username: **"your_initials+"** admin

-   Authentication type: password

-   Resource group: **"Your_initials+studentID"**

-   Region: Australia East

-   Networking

    -   Public IP: enabled

    -   Allow inbound

        -   TCP 22

        -   TCP 80

#### Include a screenshot of the following below:

**-   Overview showing deployment complete with Deployment details**

![Imgur](https://imgur.com/C2Bq0Jn.png)

**-   WebDev+StudentID**
    - Virtual Machine Overview 
    
  -![Imgur](https://imgur.com/FGly5NI.png)

**-   Networking**
    - Network Security Group

  -![Imgur](https://imgur.com/47TOgDh.png)


**- Network interface**

- ![Imgur](https://imgur.com/6RMGmsP.png)

**- Public IP Address**

- ![Imgur](https://imgur.com/YnqB7ji.png)

**- Dns label prefix**

  - ![Imgur](https://imgur.com/4a2YmwS.png)
  
**- Admin Username + Storage size configuration**

  - ![Imgur](https://imgur.com/4a2YmwS.png)



### 6.  In the future the web-server needs to be created using Infrastructure as code

  #### 1.  Provide the template and script to create this webserver. 


  #### 1.  name the template and script A2T1Q6avm**"+your_initials"** with the appropriate extension.


**Template:**
```
 {

 \"\$schema\":
 \"https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#\",

 \"contentVersion\": \"1.0.0.0\",

 \"parameters\": {

 \"vmName\": {

 \"defaultValue\": \"webdev001153227\",

 \"type\": \"String\",

 \"metadata\": {

 \"description\": \"The name of you Virtual Machine.\"

 }

 },
```

You can view the rest of the template and parameters [here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T1/A2T1Q6H_B/A2T1Q6avmHB.json)
**and** [here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T1/A2T1Q6H_B/A2T1Q6avmHBpar.json)



**Script:**
```

\$rg = \'HB001153227\'

\$pass = ConvertTo-SecureString \"azure1234567\" -AsPlainText -Force

New-AzResourceGroup -Name \$rg -Location australiaeast -Force

New-AzResourceGroupDeployment \`

-ResourceGroupName \$rg \`

-TemplateFile \"A2T1Q6avmHB.json\" \`

-TemplateParameterFile \"A2T1Q6avmHBpar.json\" \`

-adminPasswordOrKey \$pass
```

You can view the script [here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T1/A2T1Q6H_B/A2T1Q6AavmHBrun.ps1)

**Deploying the template and parameters using ps1 scripts:**

- ![Imgur](https://imgur.com/WUZmga5.png)
- ![Imgur](https://imgur.com/UrC20mc.png)



#### 2.  Create a script so that the webserver can be deleted. 

**-   name the script A2T1Q6b**"+your_initials".**
```
Stop-AzVM -Name WebDev001153227 -ResourceGroupName H_B001153227

Remove-AzVM -Name WebDev001153227 -ResourceGroupName H_B001153227
 
Get-AzResource -ResourceGroupName H_B001153227 
```

- ![Imgur](https://imgur.com/8sbu0Mw.png)



### 7.  One of your colleagues has been working on a script to create storage accounts with parameters. They are having trouble with the script validation. See scripts provided below.


#### 1.  Identify the issue and ensure that it validates and can create the resource using the template and script.

The issue that was noticed was the API
version was out of date. The api that was located in the template read
the date '2015-06-15' where the API should be the latest one, which is
'2023-01-01'. That section was swapped out and the application now
deployed without any errors.

- ![Imgur](https://imgur.com/c0bG9wz.png)

- ![Imgur](https://imgur.com/yZhbgaU.png)

#### 2.  Provide the code that resolves this issue and a screenshot of the created resource.

```
            [\"type\": \"Microsoft.Storage/storageAccounts\",]{.mark}

[            \"apiVersion\": \"**2023-01-01\",**]{.mark}

[            \"name\": \"\[parameters(\'storageName\')\]\",]{.mark}

[            \"location\": \"australiaeast\",]{.mark}

[            \"sku\": {]{.mark}

[                \"name\": \"\[parameters(\'storageSKU\')\]\"]{.mark}

[            },]{.mark}

[            \"kind\": \"StorageV2\"]{.mark}

![](media/image16.png){width="7.142857611548556in"
height="3.1666666666666665in"}

![](media/image17.png){width="7.35in" height="3.4791666666666665in"}

```

View the entirety of the template and parameter files [here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T1/A2T1Q7H_B/A2T1Q7-storageHB.json) 


```

PowerShell file name: A2T1Q7-storage.ps1 rename the updated template as
A2T1Q7-storage**"+your_initials".**ps1

> \$rg = \'**Your_initials+studentID**\'
>
> New-AzResourceGroup -Name \$rg -Location australiaeast -Force
>
> New-AzResourceGroupDeployment \`
```

View the entire powershell script [Here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T1/A2T1Q7H_B/A2T1Q7-storageHB.ps1) 



# Task 2: Update and Redeploy Resources 

### 1.  You are to modify the script you created in Task 1 to create the virtual machine. Name the template and script A2T2Q1vm**"+your_initials"** with the appropriate extensions. This script must meet the following requirements:

#### 1.  Contain parameters for the following fields in the template

  - vmname -- your_initials+studentID
    
  - location - this is automatically set based on resource group location
    
  - Stagee - with the allowed values of:
              -   Test
              -   Dev (default)
              -   Prod
    
  - virtualMachineSize (must have value of "Standard_B1s")

  - dnslabelprefix set to vmname + stage



#### 2. Contain variables for the following field in the template

  - virtualMachineName (uses vmname + stage)



#### 3. must be run from a script with no required input from command line.


**Script:**

``` 
> \$rg = \'HB001153227\'
>
> \$pass = ConvertTo-SecureString \"Azure69420?\" -AsPlainText -Force
>
> New-AzResourceGroup -Name \$rg -Location australiaeast -Force
>
> New-AzResourceGroupDeployment \`
>
```

You can view the entirety of the script [here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T2/A2T2Q1H_B/A2T2Q1runHB.ps1)

**Template:**

```
{

\"\$schema\":
\"https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#\",

\"contentVersion\": \"1.0.0.0\",

\"parameters\": {

\"vmName\": {

\"defaultValue\": \"simpleLinuxVM\",

\"type\": \"String\",

\"metadata\": {

\"description\": \"The name of you Virtual Machine.\"

}

},

\"adminUsername\": {

\"type\": \"String\",

\"metadata\": {

\"description\": \"Username for the Virtual Machine.\"

}

},

\"authenticationType\": {

\"defaultValue\": \"password\",

\"allowedValues\": \[

\"sshPublicKey\",

\"password\"

\],

\"type\": \"String\",

\"metadata\": {

\"description\": \"Type of authentication to use on the Virtual Machine.
SSH key is recommended.\"

}

},

\"adminPasswordOrKey\": {

\"type\": \"SecureString\",

\"metadata\": {

\"description\": \"SSH Key or password for the Virtual Machine. SSH key
is recommended.\"

}

[},]{.mark}

[\"dnsLabelPrefix\": {]{.mark}

[\"defaultValue\": \"\[toLower(concat(parameters(\'vmName\'),
parameters(\'stage\')))\]\",]{.mark}

[\"type\": \"String\",]{.mark}

[\"metadata\": {]{.mark}

[\"description\": \"Unique DNS Name for the Public IP used to access the
Virtual Machine.\"]{.mark}

[}]{.mark}

[},]{.mark}

\"ubuntuOSVersion\": {

\"defaultValue\": \"Ubuntu-2004\",

\"allowedValues\": \[

\"Ubuntu-1804\",

\"Ubuntu-2004\",

\"Ubuntu-2204\"

\],

\"type\": \"String\",

\"metadata\": {

\"description\": \"The Ubuntu version for the VM. This will pick a fully
patched image of this given Ubuntu version.\"

}

[},]{.mark}

[ \"stage\": {]{.mark}

[\"defaultValue\": \"Dev\",]{.mark}

[\"allowedValues\": \[]{.mark}

[\"Test\",]{.mark}

[\"Dev\",]{.mark}

[\"Prod\"]{.mark}

[\],]{.mark}

[\"type\": \"String\",]{.mark}

[\"metadata\": {]{.mark}

[\"description\": \"Staging environment that defines Test, dev, and
prod. This was created as per A2T2Q1\"]{.mark}

[}]{.mark}

},

\"location\": {

\"defaultValue\": \"\[resourceGroup().location\]\",

\"type\": \"String\",

\"metadata\": {

\"description\": \"Location for all resources.\"

[}]{.mark}

[},]{.mark}

[\"vmSize\": {]{.mark}

[\"defaultValue\": \"Standard_B1s\",]{.mark}

[\"type\": \"String\",]{.mark}

[\"metadata\": {]{.mark}

[\"description\": \"The size of the VM\"]{.mark}

}

},

\"virtualNetworkName\": {

\"defaultValue\": \"vNet\",

\"type\": \"String\",

\"metadata\": {

\"description\": \"Name of the VNET\"

}

},

\"subnetName\": {

\"defaultValue\": \"Subnet\",

\"type\": \"String\",

\"metadata\": {

\"description\": \"Name of the subnet in the virtual network\"

[},]{.mark}

[]{.mark}

[\"publicIpAddressName\": {]{.mark}

[\"type\": \"string\"]{.mark}

[},]{.mark}

[ ]{.mark}

[\"publicIpAddressType\": {]{.mark}

[\"type\": \"string\"]{.mark}

[},]{.mark}

[\"publicIpAddressSku\": {]{.mark}

[\"type\": \"string\"]{.mark}

[},]{.mark}

\"networkSecurityGroupName\": {

\"defaultValue\": \"SecGroupNet\",

\"type\": \"String\",

\"metadata\": {

\"description\": \"Name of the Network Security Group\"

}

```

You can view the entire template and associated parameters [here](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T2/A2T2Q1H_B/A2T2Q1vmHB.json) and [here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T2/A2T2Q1H_B/A2T2Q1vmHBpar.json)


### 2.  You are to create a script to modify the virtual machine you created in Task 1 Question 5 to autoshutdown at 11pm Australian Central Standard Time. Name the script A2T2Q2autoshut**"+your_initials"** with the appropriate extension.


```
az vm auto-shutdown \--resource-group
HB001153227 \--name WebDev001153227 \--time 2300 \--subscription 179c07db-6342-4e86-8ec3- d9d401badc5e
```
-![Imgur](https://imgur.com/uzXcLQO.png)
-![Imgur](https://imgur.com/VXpDotV.png)



# Task 3: Create, Configure and Deploy Monitoring for VM using IaC 

### 1.  Configure cloud monitoring for the virtual machine in Task 2.

**- Monitoring using insights:**

-![Imgur](https://imgur.com/wrViIRy.png)



**- Further graphs showing vm performance:**

-![Imgur](https://imgur.com/hLALusQ.png)



**- Map of the VM:**

-![Imgur](https://imgur.com/UV97yyN.png)
-![Imgur](https://imgur.com/Z318cNo.png)



# Task 4: Troubleshoot SQL Database and Web app services automation using IaC

The Dev team would like to see whether the SQL Database and Web app
services would be a better option in the future.

### 1.  They have a created a template and script to automate the creation of an Azure Cosmos DB database.

**- Provide a screenshot of the debug output showing errors.**

-![Imgur](https://imgur.com/Br7ANbU.png)



**-  Identify the issues and ensure that it validates and can create the resource**

The issues experienced upon attempting to create cosmoDB was that there
were no pre-defined default values under parameters; "name" and
"location". The default value for name has been updated to "cosmodbhb"
and the default value for location has been updated to
"\[resourceGroup().location\]"

-![Imgur](https://imgur.com/Gklv7eN.png)

Therefore, the creation of the new database is a success.

**- Provide the code that resolves this issue and a screenshot of the created resource.**

-![Imgur](https://imgur.com/iUIwcJq.png)

-![Imgur](https://imgur.com/U2ukSnz.png)



**Below are the modified IaC for CosmoDB:**

**Run script:**

```
\$rg = \'HB001153227\'

New-AzResourceGroup -Name \$rg -Location australiaeast -Force

New-AzResourceGroupDeployment -ResourceGroupName \'HB001153227\'
-TemplateFile \'A2T4Q1-cosmodbHB.json\'

```
You can find the script [Here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T4/A2T4Q1H_B/A2T4Q1-cosmodbrunHB.ps1)



Template:
```
{

\"\$schema\":
\"http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#\",

\"contentVersion\": \"1.0.0.0\",

\"parameters\": {

\"name\": {

\"type\": \"String\",

[\"DefaultValue\": \"cosmodbhb\"]{.mark}

},

\"location\": {

\"type\": \"string\",

[\"DefaultValue\": \"\[resourceGroup().location\]\"]{.mark}

},

\"defaultExperience\": {

\"type\": \"String\",

\"defaultValue\": \"Core (SQL)\"

},

\"isZoneRedundant\": {

\"type\": \"String\",

\"defaultValue\": \"false\"

```
You can find the rest of the template [Here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T4/A2T4Q1H_B/A2T4Q1-cosmodbHB.json)



### 2.  They have created a template and script to automate the creation of a Web App.

**- Identify the issues and ensure that it validates and can create the resource.**

The issue that has been identified was that the correct parameters were
not entered into a separate parameter file. This has been implemented
and the parameters are as follows:

1\. Location: eastasia

2\. Sku: free

3\. Skucode: free

4\. Name: 001153227webapphb


**The reason eastasia is added as a location is because the template will
not deploy successfully if any other location is used**

-![Imgur](https://imgur.com/8x5zteT.png)

**- Provide the code that resolves this issue and a screenshot of the created resource.**

-![Imgur](https://imgur.com/97UkEtM.png)

**Run script:**

```
\$rg = \'HB001153227\'

New-AzResourceGroup -Name \$rg -Location australiaeast -Force

New-AzResourceGroupDeployment -ResourceGroupName \'HB001153227\'
-templateFile \'A2T4Q2-webappHB.json\' -templateParameterFile
\'A2T4Q2-webappparamHB.json\'

```
You can find the run script [Here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T4/A2T4Q2H_B/A2T4Q2-webapprunHB.ps1)



**Parameters:**
```
{

\"\$schema\":
\"http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#\",

\"contentVersion\": \"1.0.0.0\",

\"parameters\": {

\"name\": {

\"value\": \"001153227webapphb\"

},

\"location\": {

\"value\": \"eastasia\"

},

\"sku\": {

\"value\": \"free\"

},

\"skucode\": {

\"value\": \"free\"

}

}

}

```

You can find the parameter file [Here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T4/A2T4Q2H_B/A2T4Q2-webappparamHB.json)



**Template:**

```
{

\"\$schema\":
\"http://schema.management.azure.com/schemas/2015-01-01/deploymentTemplate.json#\",

\"contentVersion\": \"1.0.0.0\",

\"parameters\": {

\"name\": {

\"type\": \"string\"

},

\"location\": {

\"type\": \"string\"

},

\"sku\": {

\"type\": \"string\"

},

\"skucode\": {

\"type\": \"string\"

}

},

\"resources\": \[

{

\"apiVersion\": \"2021-01-01\",

\"name\": \"\[parameters(\'name\')\]\",

\"type\": \"Microsoft.Web/staticSites\",

\"location\": \"\[parameters(\'location\')\]\",

\"tags\": null,

\"properties\": {},

\"sku\": {

\"Tier\": \"\[parameters(\'sku\')\]\",

\"Name\": \"\[parameters(\'skuCode\')\]\"

}

}

\]

}

```

You can find the template file [Here!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Code/T4/A2T4Q2H_B/A2T4Q2-webappHB.json)

# Now that the templates have all been instantiated, lets have a look at the [Documentation!](https://github.com/HarryB191202/Deploy-and-configure-Cloud-Resources-/blob/Harry's-Special-Corner/Docs/T3-Documentation_post_cloud_deployment.md)

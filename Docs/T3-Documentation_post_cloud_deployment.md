 # Project Task 3: Documentation: Post-Cloud Deployment

## Deployment Procedure for Creating New Virtual Machines

### Accessing Azure with a Free Subscription
To begin, you need access to an Azure subscription. A free trial is sufficient for deployment purposes:
1. Visit [Azure Free Trial](https://azure.microsoft.com/).
2. Sign up using a Microsoft account or create a new account.
3. Start using Azure services on a free trial basis for up to 12 months. Note: The free subscription is disabled after 30 days unless upgraded to a pay-as-you-go model.

### Installing Visual Studio Code and Extensions
1. Download Visual Studio Code from [VS Code Download](https://code.visualstudio.com/download).
2. Install the **Azure Tools Extension Pack**:
   - Open Visual Studio Code.
   - Press `Ctrl + Shift + X` to open the Extensions Marketplace.
   - Search for and install the **Azure Tools Extension Pack**.
3. Sign in using Azure Tools to configure and access your resources.

### Deploying Virtual Machines
#### Step 1: Installing Azure PowerShell
Run the following commands in PowerShell as an Administrator:
```powershell
Install-Module -Name Az -Repository PSGallery -Force
```

#### Step 2: Connecting to Azure
1. Open PowerShell and enter:
   ```powershell
   Connect-AzAccount
   ```
2. Log in with your Microsoft Office 365 credentials when prompted.
3. Successful login will display account details.

#### Step 3: Preparing Deployment Files
The following files are required:
- **Run Script**: `A2T2Q1runHB.ps1`
- **Template File**: `A2T2Q1vmHB.json`
- **Parameter File**: `A2T2Q1vmHBpar.json`

Ensure these files are located in the same directory.

#### Step 4: Running the Deployment Script
1. Navigate to the script directory:
   ```powershell
   CD "C:\path\to\directory"
   ```
2. Execute the script:
   ```powershell
   .\A2T2Q1runHB.ps1
   ```
3. Monitor the deployment. Successful deployment will display:
   - Resource group name
   - Virtual machine deployment name
   - Provisioning state

#### Step 5: Validation
1. Log in to the Azure portal.
2. Navigate to the appropriate resource group to verify the virtual machine deployment.

#### Step 6: Configuring Auto Shutdown
Run the following command in Azure Cloud Shell to set auto-shutdown:
```powershell
Az vm auto-shutdown --resource-group HB001153227 --name WebDev001153227 --time 2300 --subscription <subscriptionID>
```

#### Step 7: Testing SSH Connectivity
1. Generate an SSH key:
   ```bash
   ssh-keygen -m PEM -t rsa -b 2048
   ```
2. Copy the private key to the SSH section of the VM's "Connect" tab in the Azure portal.
3. Connect to the VM using the command provided in the portal.

---

## Deleting Virtual Machines Using Scripts
1. Stop the virtual machine:
   ```powershell
   Stop-AzVM -Name WebDev001153227 -ResourceGroupName HB001153227
   ```
2. Remove the virtual machine:
   ```powershell
   Remove-AzVM -Name WebDev001153227 -ResourceGroupName HB001153227
   ```
3. Validate deletion in the Azure portal by checking the resource group.

---

## Updating Existing Virtual Machines Using Scripts
1. Locate and open the template file for the virtual machine requiring updates.
2. Implement the following updates:
   - Add `dnsLabelPrefix` for the public IP:
     ```json
     "dnsLabelPrefix": {
       "defaultValue": "[toLower(concat(parameters('vmName'), parameters('stage')))]",
       "type": "String",
       "metadata": {
         "description": "Unique DNS Name for the Public IP used to access the Virtual Machine."
       }
     }
     ```
   - Add a `stage` parameter to define environments (Test, Dev, Prod):
     ```json
     "stage": {
       "defaultValue": "Dev",
       "allowedValues": ["Test", "Dev", "Prod"],
       "type": "String",
       "metadata": {
         "description": "Staging environment that defines Test, Dev, and Prod."
       }
     }
     ```
   - Include public IP attributes (`name`, `type`, `sku`).
3. Modify variables for virtual machine name:
   ```json
   "virtualMachineName": {
     "type": "string",
     "defaultValue": "[toLower(concat(parameters('vmName'), parameters('stage')))]"
   }
   ```
4. Redeploy the updated template.

---

## Test Plan
| **Test Detail**         | **Expected Result**                          | **Actual Result**                          |
|-------------------------|----------------------------------------------|--------------------------------------------|
| Template has been deployed | Successful deployment                      | Successful deployment                       |
| Custom template has been validated | Template validated successfully, and specifications matched | Validation successful; requirements met    |
| Connect using SSH to the VM | Successfully create an SSH connection to the virtual machine | Successfully connected and tested SSH      |
| Validate and test parameters | No errors with testing parameters         | No errors encountered                      |
| Virtual machine has been configured successfully | VM created and running with public IP. All parameters met | VM deployed successfully                   |

---

## Meeting Organisation Requirements
| **Requirement**                       | **Met (Yes/No)** |
|---------------------------------------|------------------|
| Automation of processes               | Yes              |
| Minimized manual intervention         | Yes              |
| Delivery of fast and reliable services| Yes              |
| Monitoring of services                | Yes              |
| Increased security                    | Yes              |
| File storage for saving code          | Yes              |
| Alternative solutions to virtual servers | Yes              |

---

## Recommendations for Improvement
To further automate the process, implement parameterization using **Azure Data Factory Studio**. Parameterization allows passing external values into pipelines, datasets, linked services, and data flows, enabling resource reuse and reducing the need to recreate resources for every change. This approach enhances efficiency, reduces costs, and optimizes time management.

---

## Summary for ICT Manager
**Purpose of Email:** Inform the ICT Manager that the documentation, procedure, results, and recommendations have been submitted.

### Deployment Results
- Successful deployment of virtual machines using scripts and templates.
- Validation of SSH connectivity and parameter configuration.

### Recommendations
- Implement parameterization to enhance automation, reduce resource consumption, and improve deployment efficiency.

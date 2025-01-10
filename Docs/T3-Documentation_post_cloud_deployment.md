# Task 5: Create Documentation

### 1.  Complete documentation for using the scripts you have created above:

  **- deployment procedure to create new virtual machines using the scripts.**

> This is an in-depth deployment procedure on how to create new virtual
> machines using the scripts that have been provided, modified and
> implemented.
>
> [Accessing azure with a free subscription]{.underline}
>
> [Before You do anything, you must firstly gain access to an Azure
> Subscription. For this deployment, a free trial option will suffice
> for now. Visit <https://azure.microsoft.com/> and sign up using your
> Microsoft account, or create a new account aand start using the free
> subscription. This subscription will provide you with all the Azure
> services, applications and peripherals on a free trial basis. Free
> services are available for up to 12 months after initially creating
> the subscription, however the free Azure subscription will be disabled
> after 30 days, and users must upgrade to pay-as-you-go.]{.mark}
>
> [Installing Visual Studio Code and its associated peripherals and
> extensions]{.underline}
>
> [Firstly, you can download visual studio code for windows by following
> this link- <https://code.visualstudio.com/download> and from there,
> you can install the appropriate extensions for VS code using the Azure
> Tools Extension pack. You can do this by opening the visual studio
> application and pressing ctrl + shift + x to open the extensions
> marketplace, here you can navigate and locate the Azure Tools
> Extension pack- which contains extensions for working with the Azure
> Application service, Azure Functions, Azure Storage, CosmosDB, and
> Azure Virtual Machines. From here, you can sign in to your account
> using Azure tools and access/ configure your resources using visual
> studio.]{.mark}

[Deployment Procedure]{.underline}

1.  As per anything to do with azure, it was first required to download
    the module 'Az' for native PowerShell- PowerShell was opened and run
    as an administrator and following code was entered:

> Install-Module -Name Az -Repository PSGallery -Force
>
> Azure PowerShell was then successfully installed on to the local
> machine
>
> Once fully installed, this command was entered in order to connect to
> the Azure account:
>
> Connect-AzAccount
>
> A login screen from office365 prompted the entry of appropriate
> details in order to gain access to the Azure client:
>
> ![](media/image31.png){width="6.25in" height="3.28125in"}
>
> Once details were entered, the following prompt was shown, this is
> indicative of a successful login:
>
> ![](media/image32.png){width="6.270833333333333in" height="1.84375in"}

The deployment procedure for creating a new virtual machine could now be
initiated.

2.  The following is needed to create a VM:

    -   Runscript.ps1 (A2T2Q1runHB.ps1)

    -   Configured Template.json (A2T2Q1vmHB.json)

> The template was copied from the deployment of a pre-existing test vm
> running an ubuntu environment, and then modified as per the
> prerequisites of argon solutions.

-   Configured Parameters.json (A2T2Q1vmHBpar.json)

-   The parameters were copied from the deployment of a pre-existing
    test vm running an ubuntu environment, and then were modi

-   

> The run script was configured with the Resource Group name, the
> appropriate location, the password and the template and parameter
> files were referenced:
> ![](media/image33.png){width="6.270833333333333in" height="2.0in"}

Password

3.  Once the run script was fully configured, PowerShell was connected
    to Azure and the directory for the run script was located. (NOTE:
    you must have the run script in the same directory as the template
    and parameter files):

> To locate and enter the appropriate directory, the following command
> was entered:

**CD "C:\\directory\\ directory name\\directory name\\A2T2Q1\\"**

> ![](media/image34.png){width="6.267361111111111in"
> height="2.8604166666666666in"}(please note that whitespace must be
> carefully considered, if there is whitespace in your directory, please
> use quotation marks.):
>
> The following command was entered- this command will run the .ps1
> file, and in term, deploy the virtual machine:
>
> .\\runscript.ps1
>
> For example- .\\A2T2Q1runHB.ps1
>
> It can be determined that the below deployment of A2T2Q1vmHB was a
> success. The VM deployment process took roughly ten minutes. The
> Resource Group name, Virtual Machine **Deployment** Name, provisioning
> state and parameters have been highlighted:
>
> ![](media/image35.png){width="6.263888888888889in"
> height="4.179166666666666in"}

4.  The virtual machine was then validated to be created by logging in
    to the azure portal and observing what was created under the
    appropriate resource group:

![](media/image36.png){width="6.263888888888889in"
height="2.923611111111111in"}

5.  Based on the prerequisites issued by argon solutions, it has been
    required to implement an autoshutdown. To do this, the Cli/PS tab at
    the top of the virtual machine overview page on azure was located,
    and under the "auto shutdown" page, the following code was copied
    and entered in to the azure cloud shell:

> **Az vm auto-shutdown --resource-group HB001153227 --name
> WebDev001153227 --time 1730 --subscription (subscriptionID)**
>
> The time was substituted from 1730 (5:30 pm) to 2300 (11:00 pm) as per
> argon solutions' requirements, and the subscription ID was entered:
>
> ![](media/image20.png){width="6.25in" height="2.0in"}
>
> ![](media/image19.png){width="6.263888888888889in"
> height="2.8402777777777777in"}The following result was generated- as
> you can see, the VM is now scheduled to automatically shut down at
> 11:00PM:

6.  We then want to test that at least one of the ports to the VM is
    accessible. To do this, we will connect via SSH.

> Firstly, the SSH key was generated using the following command
>
> Ssh-keygen -m PEM -t rsa -b 2048
>
> The private directory where the key is located was then copied and
> pasted under the ssh section of the "connect" tab of the VM:
> ![](media/image37.png){width="6.270833333333333in"
> height="2.8020833333333335in"}![](media/image38.png){width="6.270833333333333in"
> height="4.979166666666667in"}
>
> The command under section 4 of the above (highlighted) is then copied
> and pasted in to PowerShell, the appropriate password for the VM is
> entered and then you are able to connect:
>
> ![](media/image39.png){width="6.260416666666667in" height="3.84375in"}
>
> You can validate that you have connected by looking at the user that
> you currently are (HBAdmin@hb001153227).

a.  procedure for deleting virtual machines using the scripts

> This procedure outlines how I achieved deleting virtual machines using
> a script and how I validated the deletion.

1.  The following script was entered in to azure cloud shell:

> Stop-AzVM -Name WebDev001153227 -ResourceGroupName HB001153227
>
> (stops the virtual machine in order to prepare the environment for a
> safe deletion)
>
> Remove-AzVM -Name WebDev001153227 -ResourceGroupName HB001153227
>
> (removes the vm in a safe manner)
>
> ![](media/image13.png){width="6.270833333333333in"
> height="4.041666666666667in"}

2.  From here, we can validate that the VM has been deleted by simply
    going on to the azure portal and opening the resource group- if the
    virtual machine has been successfully deleted, there should not be
    any content pertaining to the virtual machine present in the
    allocated resource group.

    a.  procedure for updating an existing virtual machine using the
        scripts.

> This is the procedure that was used to update existing virtual
> machines using the scripts:

1.  Firstly, the template for the virtual machine that requires updates
    to be implemented was located and opened. Below is the template
    before the updates were implemented (A2T1Q6avmHB):

> ![](media/image40.png){width="6.25625in" height="3.520138888888889in"}

2.  Secondly, based on the given prerequisites by argon solutions, the
    following segments of code were appended to the deployment ahead of
    redeployment:

> [},]{.mark}
>
> [\"dnsLabelPrefix\": {]{.mark}
>
> [\"defaultValue\": \"\[toLower(concat(parameters(\'vmName\'),
> parameters(\'stage\')))\]\",]{.mark}
>
> [\"type\": \"String\",]{.mark}
>
> [\"metadata\": {]{.mark}
>
> [\"description\": \"Unique DNS Name for the Public IP used to access
> the Virtual Machine.\"]{.mark}
>
> [}]{.mark}
>
> [},]{.mark}
>
> [Dnslabelprefix appends the DNS name for the public Ip used to access
> the virtual machine. This code is implemented towards the start of the
> parameters section of the template.]{.mark}
>
> [},]{.mark}
>
> [ \"stage\": {]{.mark}
>
> [\"defaultValue\": \"Dev\",]{.mark}
>
> [\"allowedValues\": \[]{.mark}
>
> [\"Test\",]{.mark}
>
> [\"Dev\",]{.mark}
>
> [\"Prod\"]{.mark}
>
> [\],]{.mark}
>
> [\"type\": \"String\",]{.mark}
>
> [\"metadata\": {]{.mark}
>
> [\"description\": \"Staging environment that defines Test, dev, and
> prod. This was created as per A2T2Q1\"]{.mark}
>
> [}]{.mark}
>
> [},]{.mark}

[ The stage parameter was requested to be implemented by argon solutions
and acts as a staging environment defining test, dev and prod.]{.mark}

[},]{.mark}

[]{.mark}

[ \"publicIpAddressName\": {]{.mark}

[ \"type\": \"string\"]{.mark}

[ },]{.mark}

[ ]{.mark}

[ \"publicIpAddressType\": {]{.mark}

[ \"type\": \"string\"]{.mark}

[ },]{.mark}

[ \"publicIpAddressSku\": {]{.mark}

[ \"type\": \"string\"]{.mark}

[ },]{.mark}

> [The initial template did not have a public address name, type or sku
> implemented, so argon solutions has requested that this be implemented
> under the parameters section of the template.]{.mark}
>
> [\"variables\": {]{.mark}
>
> [ \"virtualMachineName\": {]{.mark}
>
> [ \"type\": \"string\",]{.mark}
>
> [ \"defaultValue\" : \"\[toLower(concat(parameters(\'vmName\'),
> parameters(\'stage\')))\]\"]{.mark}
>
> [ },]{.mark}
>
> [This code was already implemented in to the template, though we were
> asked to modify its contents to include VmName and stage- this section
> is towards the bottom of the parameters section.]{.mark}

3.  The template was then redeployed, and thus updated in accordance
    with argon solutions' prerequisites. The parameters are highlighted
    below:

> ![](media/image35.png){width="6.263888888888889in"
> height="4.179166666666666in"}

2.  Once cloud resources have been deployed complete the test plan you
    created in Task1 Q4.

Insert your test plan details below from Task 1 Q4.

  -----------------------------------------------------------------------
  **Test detail**       **Expected result**     **Actual result**
  --------------------- ----------------------- -------------------------
  Template has been     Successful deployment   Successful deployment
  deployed                                      

  Custom template has   Template has been       Successful validation of
  been validated        validated successfully, template and requirements
                        and specifications for  given by argon solutions
                        the template have been  have been matched
                        matched                 

  Connect using SSH to  Successfully maintain   Successfully connected
  the VM                and create a ssh        and ran a SSH
                        connection to the       connectivity test (see
                        virtual machine         above)

  Validate and test     No errors with testing  No errors with parameters
  parameters            parameters              upon testing

  Virtual machine has   Successful creation and Successful deployment of
  been configured       deployment of a Virtual VM with all associated
  successfully          machine using scripts   parameters, scripts and
                        and templates.          templates. All required
                        Parameters are          prerequisites given by
                        adequately met, virtual Argon Solutions have been
                        machine running with    met, and the vm is
                        public IP               running with a public IP
                                                address.
  -----------------------------------------------------------------------

3.  Using the table below to demonstrate the Test Plan meets the
    requirements for Argon Solutions

  -----------------------------------------------------------------------
  **Organisation Requirements**       **Cloud resource meets task
                                      requirements and business need\
                                      (Yes or No)**
  ----------------------------------- -----------------------------------
  Automation of processes             Yes

  Minimises manual intervention       Yes

  Delivery of Fast and reliable       Yes
  services                            

  Monitoring of services              Yes

  Increased security                  Yes

  File storage for saving code        Yes

  Alternative solutions to virtual    Yes
  servers                             

                                      
  -----------------------------------------------------------------------

4.  Provide the recommendation to improve the automation process

[Because we are currently deploying Vm's using IaC- more specifically-
using scripts, I recommend that all other peripherals of the argon
solutions VM are parameterized using Azure Data Factory Studio and thus
further automating the Virtual Machine deployment process.]{.mark}

[You can use parameters to pass external values into pipelines,
datasets, linked services, and data flows. Once the parameter has been
passed into the resource, it cannot be changed. By parameterizing
resources, you can reuse them with different values each time, thus a
new resource does not have to be recreated with new parameters and data
every time a change needs to be made. I believe this might be beneficial
for argon solutions to implement, because it will assist with
efficiency, automation and speed.]{.mark}

[This will heavily reduce resource cost consumption, as well as further
manage time, as parameterisation will append new data to an already
created resource with minor or no interruption whatsoever. For example,
if you would like to connect to different databases on the same logical
SQL server, you can parameterize the database name in the linked service
definition, thus preventing you from having to create a linked service
for each database on the logical SQL server.]{.mark}

**Task 6: Email -- Communicate Outcomes and Obtain Sign Off**

Once you have completed the documentation, submit this document
(Assignment) via LEARN

After you have submitted the document, you are required to:

-   Compose an email to the ICT Manager (Lecturer)

-   Do not send it but save and submit this email to LEARN.

-   The email should include a summary of the following. (Approx. 150
    words)

<!-- -->

-   Purpose of your email

<!-- -->

-   Inform the ICT Manager that the completed documentation including
    the procedure and results, and the recommended improvement has been
    submitted

-   Provide a summary of the deployment results

-   Provide a summary of the recommended improvement

> ![](media/image41.png){width="6.2652777777777775in"
> height="4.417361111111111in"}

# Ansible running in a Docker container  - Azure

Create an Azure Service Principal =>
<pre>az ad sp create-for-rbac --name <service-principal-name> \
        --role Contributor \
        --scopes /subscriptions/<subscription_id>
        
   Replace <service-principal-name> with your service principal name.     
        </pre>

Build the Docker image used to run Ansible
<pre>docker build . -t ansible</pre>

Start the Ansible container.

<pre>docker run -it ansible 
run => ansible --version
</pre>

# Connect to Azure from the Ansible container.
Assign the following environment variables to connect to Azure:
<pre>
export AZURE_TENANT="<azure_tenant_id>"
export AZURE_SUBSCRIPTION_ID="<azure_subscription_id>"
export AZURE_CLIENT_ID="<service_principal_app_id>"
export AZURE_SECRET="<service_principal_password>"
</pre>


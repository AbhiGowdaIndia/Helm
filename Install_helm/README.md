# Installing Helm in linux machines.

### Install on Linux (Ubuntu/CentOS/RHEL) - Using offcial script.

  **curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash**

  * **Just by running this command helm will insatll in our system using the official scrip.**

### Install Helm using apt (Ubuntu/Debian) - using script

  * Run the **Install_in_Ubuntu.sh** to install helm.
  * In **Instal_in_ubutu.sh** file, we will do:
    * Downloads Helm’s GPG signing key
    * The key ensures the packages are trusted and not tampered
    * Pipes (|) the downloaded key directly into apt-key add -
    *  \- means "read from stdin"
    * Installs support for HTTPS-based repositories in apt
    * Adds the Helm repository URL to apt’s repo list
    * Updates apt package index
    * Installs the Helm binary from the official repository
    * After this, helm command becomes available

### Install Helm using yum (CentOS/RHEL) - using script

  * Run the **Install_in_RHEL.sh** to install helm.
  * In **Instal_in_RHEL.sh** file, we will do:
    * Downloads Helm’s GPG signing key
    * rpm --import - imports the key to verify Helm packages
    * Creates a YUM repository file and Writes the input into /etc/yum.repos.d/helm.repo
    * Installs Helm from the repo you just added
    * After this, helm command becomes available

### Install Helm manually

  * Download helm compressed archive
  
    **curl -LO https://get.helm.sh/helm-v3.14.4-linux-amd64.tar.gz**

  * Extract the gzip-compressed tar archive
  
    **tar -zxvf helm-v3.14.4-linux-amd64.tar.gz**
  
  * Move the Extracted file to **/usr/local/bin/helm** location

    **mv linux-amd64/helm /usr/local/bin/helm**
  
  * Remove the compressed archive file that we downloaded

    **rm -rf linux-amd64 helm-${HELM_VERSION}-linux-amd64.tar.gz**

  * Check the helm verion - (helm command is availabe)

    **helm version**




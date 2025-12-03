# Installing Helm in linux machines.

### Install on Linux (Ubuntu/CentOS/RHEL) - Using offcial script.

  **curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash**

  * **Just by running this command helm will insatll in our system using the official scrip.**

### Install Helm using apt (Ubuntu/Debian)

  * Run the **Install_in_ubuntu.sh** to install helm.
  * The **Instal_in_ubutu.sh** file, we will do:
    * Downloads Helm’s GPG signing key
    * The key ensures the packages are trusted and not tampered
    * Pipes (|) the downloaded key directly into apt-key add -
    *  \- means "read from stdin"
    * Installs support for HTTPS-based repositories in apt
    * Adds the Helm repository URL to apt’s repo list
    * Updates apt package index
    * Installs the Helm binary from the official repository
    * After this, helm command becomes available


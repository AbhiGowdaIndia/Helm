# Helm commonaly used commands

* To add a Helm chart repository

  **helm repo add \<repo-name> \<repo-url>**

  * **repo-name** → Any name you want to give

  * **repo-url** → URL of the Helm chart repository

  Examples:  

    **helm repo add bitnami https://charts.bitnami.com/bitnami**  
    **helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx**  
    **helm repo add eks https://aws.github.io/eks-charts**

* List all charts available inside a specific repository that you have already added.

  **helm search repo \<repo_name>**

  Examples:  
    **helm search repo bitnami**

    * To serach perticular chart in a repo (Examaple Nginx)  
      **helm search repo bitnami | grep nginx**

* To generate a new Helm chart folder with all the necessary files and directories.

  **helm create \<chart_name>**

  Example:  
    **helm create payment**

* To renders your Helm chart into plain Kubernetes YAML without installing it into the cluster

  **helm template <release-name> <chart-directory>**

  Example:  
    **helm template payment ./payment**

  * By apply custom values:  

    **helm template payment ./payment -f values-prod.yaml**

* To displays the default values.yaml of a Helm chart without installing it.

  **helm show values \<chart_name>**

  Example:  
    **helm show values bitnami/nginx**

* To deploy a Helm chart into your Kubernetes cluster

  **helm install <release-name> <chart-path-or-chart-name>**

  Examples: 
    **helm install payment ./payment**  
    **helm install my-nginx bitnami/nginx**

  * Install using custom values   

    **helm install payment ./payment -f values-prod.yaml**

  * Install and override values  

    **helm install payment ./payment --set replicaCount=3**

  * Install but preview first (dry-run)  

    **helm install payment ./payment --dry-run --debug**

  * Install and wait until pods are ready

    **helm install payment ./payment --wait**

  * Install into a different namespace (will create new namspace with the anme "dev")

    **helm install payment ./payment -n dev --create-namespace**

* To view all Helm releases that are installed in your Kubernetes cluster.

  (This will show all releases in the default namespace.)  
  **helm list**
  
  * List releases in a specific namespace

    **helm list -n dev**    

  * List releases across all namespaces

    **helm list -A**  or **helm list --all-namespaces**

  * Show only releases that failed

    **helm list --failed**

  * Show deleted releases (in history)

    **helm list --deleted**

* To bundle your Helm chart directory into a single .tgz (tar.gz) file.

  **helm package <chart-directory>**

  Example:  
    **helm package ./payment**  
      * This will package our chart directory to "payment-0.1.0.tgz"  
      * Helm reads the version from Chart.yaml  
    
  * To specify the output directory  
    
    * The .tgz will be stored inside the build/ folder.  
      **helm package ./payment -d ./build**     
    
  * To update dependencies before packaging

    **helm dependency update ./payment**   
    **helm package ./payment**

  * To distribute your chart to your team, they can install it with:

    **helm install payment payment-0.1.0.tgz**

* To create an index.yaml file for a folder that contains packaged Helm charts

  **helm repo index .**
  
  * . → current directory  
  * Helm scans the directory and finds all .tgz chart files  
  * It creates an index.yaml file containing metadata for all charts  

  * This generates:
    
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;index.yaml  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;payment-0.1.0.tgz  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;orders-1.2.0.tgz  

* To create a local Helm repo

  **helm repo index .**  
  **helm repo add myrepo file://$(pwd)**

* Host a repo on GitHub Pages

  * Keep your .tgz files + index.yaml in "gh-pages" branch   (We need to have a git branch with name "gh-pages")
  
    **helm repo add myrepo https://\<username>.github.io/\<repo>/**

* To remove a Helm release from your Kubernetes cluster.

  **helm uninstall <release-name>**

  Example:
    **helm uninstall payment**

    * If specify namespace.  
      **helm uninstall payment -n dev**

    * Uninstall multiple releases  
      **helm uninstall payment orders backend**

    * Keep the release history (don’t delete stored metadata)  
      **helm uninstall payment --keep-history**

* To manage chart dependencies in Helm.

  **helm dependency <command> <chart-directory>**

  * Where <command> can be:

    * update

    * build

    * list

    * add

    * update

  * To shows the dependencies of a chart

    **helm dependency list ./mychart**
  
  * To downloads and updates all dependencies defined in Chart.yaml

    **helm dependency update ./mychart**

  * Builds dependencies from charts/ folder if Chart.lock exists.

    **helm dependency build ./mychart**

* To to update an existing Helm release with a new chart or new values without uninstalling it.

  **helm upgrade <release-name> <chart-path-or-chart-name> [flags]**

    * **<release-name> →** the name of the existing release

    * **<chart-path-or-chart-name> →** local chart folder or chart from a repo

  * Upgrade using custom values

    **helm upgrade payment ./payment -f values-prod.yaml -n dev**

  * Upgrade using --set

    **helm upgrade payment ./payment --set replicaCount=3 -n dev**

  * Upgrade from a chart repo

    **helm upgrade my-nginx bitnami/nginx --version 13.0.0**


           
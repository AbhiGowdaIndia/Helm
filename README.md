# Helm

* **Helm is a package manager for Kubernetes applications thatincludes templeting and lifecycle management functionality.** 
* **Helm uses a packaging format called carts.**  
* **A chart is acollection of files that describes a related set of kubernetes resources.**  

### Helm Chart Directory Structure

* **A typical Helm chart has the following structure:**

**mychart/**    
├── Chart.yaml   
├── values.yaml  
├── values.production.yaml        # (optional) env-specific values  
├── charts/                        # (optional) dependent charts  
├── templates/  
│   ├── deployment.yaml  
│   ├── service.yaml  
│   ├── ingress.yaml  
│   ├── configmap.yaml   
│   ├── secrets.yaml  
│   ├── hpa.yaml  
│   ├── _helpers.tpl              # helper template functions  
│   └── NOTES.txt                 # post-install notes  
└── README.md                     # chart documentation  

### 📁 Directory & File Explanation


# Simple explanation about this chart folder.

### Chart.yaml

  * Contains metadata about the chart.

  * Includes:

    * **name:** chart name (first_chart)

    * **version:** chart version (0.1.0)

    * **appVersion:** version of the app (1.0)

    * **description:** short description of the chart

  * Helm uses this to identify the chart and package it.

### values.yaml

  * Defines default configuration values for the chart.

  * Includes:

    * **replicaCount:** number of pods to run

    * **image:** Docker image info (repository, tag, pullPolicy)

    * **service:** type of service (ClusterIP) and port

  * Users can override these values during install with **--set** or **-f**.

### templates/deployment.yaml

  * Kubernetes Deployment manifest in Helm template format.

  * Uses placeholders like {{ .Values.replicaCount }} and {{ .Release.Name }}.

  * Defines:

    * Number of replicas

    * Container image and pull policy

    * Labels and selector

    * Ports

### templates/service.yaml

  * Kubernetes Service manifest to expose the deployment.

  * Uses values from values.yaml for:

    * type (ClusterIP)

    * port

  * Connects the service to the pods via the selector using labels.


**In short:**

  * **Chart.yaml →** chart info

  * **values.yaml →** configurable defaults

  * **deployment.yaml →** defines pods/replicas

  * **service.yaml →** exposes the pods in the cluster

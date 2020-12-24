# Deploy di FaunaDB!

Le funzioni serverless si sposano bene con l'utilizzo di Database Serverless. In questo esempio deployeremo FaunaDB, il database serverless sviluppato dai creatori di Twitter e vi inseriremo dei dati di esempio.

## Deployment con Kubectl
Visualizziamo il nostro deployment:
`less faunadb-deployment.yaml`{{execute}}

Abbiamo un pod che avvia l'immagine docker di FaunaDB e persiste le informazioni su un Persistent Volume in locale tramite il Persistent Volume Claim definito nel file.
Il pod e' raggiungibile tramite un servizio di tipo ClusterIP.

Procediamo al Deploy degli elementi definiti nel file:

`kubectl apply -f faunadb-deployment.yaml`{{execute}}

Attendiamo qualche attimo e verifichiamo che gli elementi rilasciati siano attivi:

`kubectl get deployments`{{execute}}

`kubectl get services`{{execute}}

`kubectl get persistent-volumes`{{execute}}

`kubectl get persistent-volume-claims`{{execute}}

Il nostro deploy è composto da un solo pod:

`kubectl get pods`{{execute}}


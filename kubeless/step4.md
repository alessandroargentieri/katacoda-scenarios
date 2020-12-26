
Si può attivare una funzione kubeless tramite un meccanismo PubSub. La funzione, in questo modo, prende in input i messaggi da una coda specifica detta _topic_.

Nell'esempio in questione utilizzeremo il sistema di messaggi Kafka.

## Installiamo Kafka
Nella pagina ufficiale di Kafka si può trovare un manifest con cui fare il deploy di Kafka e Zookeper tramite un insieme di oggetti kubernetes di tipo _StatefulSet_.

Utilizzeremo il manifest presente nella directory di root:

`ls kafka*`{{execute}}

Andiamo ad installare Kafka e Zookeper:

`kubectl create -f kafka-zookeeper-v1.1.0.yaml`{{execute}}

Visioniamo gli oggetti _StatefulSet_ istanziati nel cluster:

`kubectl -n kubeless get statefulset`{{execute}}

Visioniamo gli oggetti _Service_ istanziati nel cluster:

`kubectl -n kubeless get svc`{{execute}}


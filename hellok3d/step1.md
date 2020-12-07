
# Benvenuti in Easycloud!

Ciao, questo terminale ti permettera' di accedere alle funzionalita' del tuo Cloud Provider inventato che si chiama Easycloud. 
Potrai esercitare le tue nuove abilita' creando un cluster di macchine kubernetes, effettuando il deploy di servizi web ed esplorando le possibilita' di kubernetes.

## Lanciamo l'ambiente Easycloud
Entriamo nel nostro ambiente cloud simulato:

`launch.sh`{{execute}}

## Crea il tuo primo cluster kubernetes
Creiamo un cluster kubernetes con il tool di Easycloud `clusterinit`
Il cluster avra' un nodo master e due nodi worker e si chiamera' `demo`

`clusterinit`{{execute}}

Controlliamo il cluster appena creato usando `kubectl`.

`kubectl cluster-info`{{execute}}

Quali sono le macchine (i nodi) del nostro cluster provisionati?

`kubectl get nodes`{{execute}}


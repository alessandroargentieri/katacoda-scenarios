
Abbiamo installato FaunaDB, Kubeless, Kafka e Zookeper, adesso possiamo passare al deploy e al test delle nostre funzioni serverless.


## Visioniamo il codice sorgente

Visioniamo il codice sorgente delle nostre funzioni serverless _Save_ e _Read_ definite nello stesso file:

`less petfunction.go`{{execute}}

Entrambe le funzioni si interfacceranno con FaunaDB, la cui dipendenza è definita nel file:

`less go.mod`{{execute}}

## Facciamo il deploy con Kubeless

Utilizziamo Kubeless CLI precedentemente installata per fare il deploy delle due funzioni serverless scritte in Golang.

`kubeless function deploy save-pets --runtime go1.14 --handler petfunction.Save --from-file petfunction.go --dependencies go.mod --env FAUNA_KEY=$FAUNA_KEY --env FAUNA_URL=http://faunadb.default.svc.cluster.local:8443`{{execute}}

`kubeless function deploy read-pets --runtime go1.14 --handler petfunction.Read --from-file petfunction.go --dependencies go.mod --env --env FAUNA_KEY=$FAUNA_KEY --env FAUNA_URL=http://faunadb.default.svc.cluster.local:8443`{{execute}}

Visioniamo le funzioni con Kubeless CLI:

`kubeless function ls`{{execute}}

## Dichiariamo i trigger

Per attivare le due funzioni dobbiamo dichiarare quali siano i _trigger_ associati a ciascuna funzione, ovvero la sorgente degli eventi che attiva la funzione stessa.

La funzione _save-pets_ sarà attivata da un messaggio letto dal _topic_ Kafka _pets_topic_, mentre la funzione _read-pets_ sarà attivata da una chiamata https.

Creiamo il topic _pets_topic_ usando Kubeless CLI:

`kubeless topic create pets-topic`{{execute}}

Creiamo il trigger _save-pets-trigger_ che andrà ad attivare la funzione _save-pets_:

`kubeless trigger kafka create save-pets-trigger --function-selector created-by=kubeless,function=save-pets --trigger-topic pets-topic`{{execute}}

La funzione _read-pets_ sarà attivata da una chiamata verso https://pets.example.com/pets.
Per simulare la registrazione del dominio _pets.example.com_ possiamo registrare il dominio localmente in /etc/hosts:

`echo "$(minikube ip) pets.example.com" | sudo tee -a /etc/hosts`{{execute}}

Andiamo adesso a creare un _self signed certificate_ per poter fare le chiamate in https:

`openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=pets.example.com"`{{execute}}

Salviamo il certificato prodotto in un _secret_ di kubernetes:

`kubectl create secret tls tls-secret --key tls.key --cert tls.crt`{{execute}}

Andiamo a creare il trigger https per la funzione _read-pets_:

`kubeless trigger http create read-pets-trigger --function-name read-pets --path pets --hostname pets.example.com --cors-enable --tls-secret tls-secret`{{execute}}


## Testiamo il nostro sistema

Adesso che abbiamo fatto il deploy delle funzioni serverless e dei rispettivi trigger, proviamo a salvare sul database e recuperare l'informazione salvata.
Per attivare la funzione _save-pets_ ed effettuare un salvataggio su FaunaDB scriviamo un messaggio sul topic _pets_topic_:

`kubeless topic publish --topic pets-topic --data '{"name": "Greg", "age": 3}'`{{execute}}

Verifichiamo che il dato sia stato inserito e che venga recuperato correttamente tramite la funzione _read-pets_ azionata tramite la chiamata https:

`curl -s -D - -k  -X POST 'https://pets.example.com/pets' -d '{"name": "Greg"}'`{{execute}}









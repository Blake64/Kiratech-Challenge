**_Obiettivi_**

Eseguire il provisioning di un cluster Kubernetes composto da un manager e
due workers e deployare una applicazione composta da almeno tre servizi e
che presenti una interfaccia grafica accessibile via browser.

**_Requisiti_**

Il cluster Kubernetes deve essere installato su una infrastruttura basata su
Virtual Machines configurate utilizzando Ansible. Le configurazioni da applicare
devono garantire il rispetto dei requisiti in termini di Risorse Computazionali,
Filesystem e Sicurezza (minima) relativi a Kubernetes.
Il provisioning delle Virtual Machine può essere eseguito con un tool a scelta,
indicandone in un README.md le motivazioni della scelta.

Il provisioning del cluster Kubernetes deve essere eseguito predisponendo un
provider Terraform che:

- Installi un manager e due worker configurando un cluster Kubernetes
- Crei un namespace denominato “kiratech-test”
- Esegua un benchmark di security a scelta disponibile pubblicamente (*)

(*) è opportuno motivare in un README.md le ragioni dietro la scelta del
benchmark di security selezionato.

Il deployment di una applicazione a scelta deve essere effettuato utilizzando
Helm. L’applicazione deve essere composta da almeno tre servizi. È richiesto
che l’applicazione sia deployata in modo tale da permetterne un
aggiornamento ad una eventuale nuova versione limitando al minimo il tempo
di indisponibilità dell’applicazione stessa.

È consigliato il riuso di codice Terraform, Ansible ed Helm reso disponibile nella
community open- source. In caso di riutilizzo di codice è importante motivare I
criteri di selezione, conoscerne le feature e i contenuti, e saper descrivere
eventuali personalizzazioni effettuate ai fini di svolgere le attività di cui sopra.

**_Versioning del Codice:_**

Versionare il codice in un repository pubblico su Github.com, in modo che vi sia
una chiara descrizione del lavoro svolto nella History del repository.

**_Continuous Integration:_**


Configurare una pipeline di Continuous Integration su un tool a scelta, e
impostare il linting per il codice Terraform, Ansible ed Helm



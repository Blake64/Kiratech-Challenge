## Valutazione dei requisiti 

la traccia richiedeva la creazione di 3 VM totali di cui 1 master 2 worker.
Ho iniziato a valutare i diversi free tier che mi venivano offerti dai cloud provider scegliendo come soluzione finale **Google Cloud**  anche se la mia scelta primaria era orientata su **AWS** ma le istanze offerte dal free tier erano troppo poco performanti ed oltretutto non avevo abbastanza spazio per i dischi. 

Google cloud mette a disposizione per un periodo di 90 giorni 300$ in crediti da poter utilizzare per la maggior parte dei servizi cloud. ho provveduto quindi a elaborare la 1 soluzione scegliendo come cluster Kubernetes una versione che mi permetesse di usare meno risorse rispetto a Kubernetes vanilla, **K3s.**

**K3s** è una distribuzione Kubernetes certificata  progettata per carichi di lavoro di produzione, luoghi remoti non presidiati e con risorse limitate o all'interno di dispositivi IoT.

 Post-installazione una volta verificato che l'installazione del cluster fosse andata a buon fine ho inziato a lavorare sul deployment ma quando andavo ad esporre un servizio di tipo Load Balancer per esporre ad esempio la porta 80 del servio httpd non mi veniva assegnato un external IP in quanto non era configurato un load balancer virtuale. Ho provato l'installazione di Kube-vip ma senza ottenere i risultati sperati. 

Ho successivamente elaborato una 2 soluzione che prevede l'uso di un Cluster Kubernetes Gestito tramite Google Kubernetes Engine. questa soluzione ha risolto il problema del Load Balancer in quanto il cluster Kubernetes gestito si occupa in autonomia dell'installazione del cluster e dei suoi componenti.

Sia sulla prima che sulla seconda soluzione ho provveduto alla creazione del namespace kiratech-challenge

## Benchmark di Sicurezza

per la scelta del Benchmark ho scelto Kube-bench in quanto per eseguire i check di sicurezza fa riferimento ai controlli documentati nel CIS Kubernetes Benchmark inoltre supporta anche i controlli di sicurezza per i principali servizi gestiti Cloud come ad esempio EKS, GKE,AKS etc. 

di seguito il link alla pagina Github: [Kube-bench](https://github.com/aquasecurity/kube-bench?tab=readme-ov-file)

 ## Deployment dei servizi con Helm 
 ho provveduto con Helm a creare un nuovo chart che comprendesse la creazione di 3 deployment con replica 1 di 3 servizi: 

 - Frontend servito da **Apache httpd**
 - Backend servito da **Node.js**
 - Database servito da **Mysql**

per il Backend e il Database ho creato 2 services di tipo ClusterIP per quanto riguarda invece il Frontend ho provveduto a creare un service di tipo Load Balancer in modo che quest'ultimo potesse essere raggiunto via web.











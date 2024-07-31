provider "google" {
	project = "kiratech-challenge-431118"
	region = "europe-west12"
	zone = "europe-west12-a"
}



resource "google_compute_firewall" "k3s-firewall" {
  name    = "k3s-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "6443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["k3s"]
  direction     = "INGRESS"
}

resource "google_compute_address" "k3s_master_ip" {
  name = "k3s-master-ip"
}

resource "google_compute_instance" "k3s_master_instance" {
  name         = "k3s-master"
  machine_type = "e2-small"
  tags         = ["k3s", "k3s-master"]

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20200805"
    }
  }

  metadata = {
    ssh-keys = "debian:${file("~/.ssh/google_compute_engine.pub")}"
  }

  network_interface {
    network = "default"

    access_config {}


  }


provisioner "local-exec" {
    command = <<EOT
            k3sup install \
            --ip ${self.network_interface[0].access_config[0].nat_ip} \
            --context k3s \
            --ssh-key ~/.ssh/google_compute_engine \
            --user debian
        EOT
  }

  depends_on = [
    google_compute_firewall.k3s-firewall,
  ]
}


# CREAZIONE WORKER 


resource "google_compute_instance" "k3s_worker_instance" {
  count        = 2
  name         = "k3s-worker-${count.index}"
  machine_type = "e2-small"
  tags         = ["k3s", "k3s-worker"]

  boot_disk {
    initialize_params {
      image = "debian-9-stretch-v20200805"
    }
  }

    metadata = {
    ssh-keys = "debian:${file("~/.ssh/google_compute_engine.pub")}"
  }

  network_interface {
    network = "default"

    access_config {}

  }


provisioner "local-exec" {
    command = <<EOT
            k3sup join \
            --ip ${self.network_interface[0].access_config[0].nat_ip} \
            --server-ip ${google_compute_instance.k3s_master_instance.network_interface[0].access_config[0].nat_ip} \
            --ssh-key ~/.ssh/google_compute_engine \
            --user debian

            sleep 30 
            export KUBECONFIG=/home/antonio/kiratech-challenge/kubeconfig 
            kubectl config use-context k3s
            kubectl label node ${self.name} node-role.kubernetes.io/worker=worker

        EOT
  }

  depends_on = [
    google_compute_firewall.k3s-firewall,
  ]
}



  depends_on = [
    google_compute_firewall.k3s-firewall,
  ]
}





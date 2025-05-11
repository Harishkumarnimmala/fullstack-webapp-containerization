# 🚀 Fullstack Web App Containerization

This project demonstrates the containerization of a fullstack web application using Docker and Docker Compose, tested in a Vagrant-managed Ubuntu VM for a production-like simulation.

---

## 📦 Prerequisites

- JDK 11  
- Maven 3  
- MySQL 8  
- Docker & Docker Compose  
- Vagrant (with VMware provider)

---

## 💻 Technologies Used

- Spring MVC, Spring Security, Spring Data JPA  
- Tomcat, MySQL, Memcached, RabbitMQ, Elasticsearch  
- JSP, Maven  
- Docker, Docker Compose  
- Vagrant, VMware

---

## 📂 Vagrant Setup (Ubuntu VM)

Your `Vagrantfile` is configured with:

- Box: `spox/ubuntu-arm`
- Private network IP: `192.168.56.11`
- Provider: VMware
- Memory: 2048MB

### 🟢 Steps

1. Start the VM:
   ```bash
   vagrant up
   ```

2. SSH into the VM:
   ```bash
   vagrant ssh
   ```

3. Add `vagrant` user to Docker group:
   ```bash
   sudo usermod -aG docker vagrant
   exit
   vagrant ssh
   ```

4. Verify:
   ```bash
   id vagrant
   ```

Now you can run Docker commands as `vagrant`.

---

## 🧱 Docker Compose Stack

This app uses Docker Compose to deploy:

| Service       | Description              | Port  |
|---------------|--------------------------|-------|
| `vprodb`      | MySQL database           | 3306  |
| `vprocache01` | Memcached cache          | 11211 |
| `vpromq01`    | RabbitMQ message broker  | 5672  |
| `vproapp`     | Java web app (Tomcat)    | 8080  |
| `vproweb`     | NGINX front-end          | 80    |

---

## ▶️ Run the Application

```bash
docker compose up -d --build
```

Access the web app at:

```
http://192.168.56.11
```

To shut down:

```bash
docker compose down
```

---

## 🐳 Useful Docker & Docker Compose Commands

### 📦 Docker Basics

```bash
docker --version                          # Check Docker version
docker ps                                 # List running containers
docker ps -a                              # List all containers
docker stop <container_id>                # Stop container
docker start <container_id>               # Start container
docker rm <container_id>                  # Remove container
docker exec -it <container> /bin/bash     # Access container shell
docker images                             # List images
docker rmi <image_id>                     # Remove image
docker build -t <image_name> .            # Build image
```

---

### 🧹 Docker Cleanup

```bash
docker container prune                    # Remove stopped containers
docker image prune -a                     # Remove unused images
docker volume prune                       # Remove unused volumes
```

---

### 📂 Docker Volumes

```bash
docker volume ls                          # List volumes
docker volume inspect <volume_name>      # Inspect a volume
docker volume rm <volume_name>           # Remove a volume
```

---

### ⚙️ Docker Compose Commands

```bash
docker compose up -d                      # Start all services
docker compose up -d --build              # Rebuild and start
docker compose down                       # Stop and remove
docker compose ps                         # Check status
docker compose logs                       # View logs
docker compose logs <service>            # View logs for one
docker compose restart <service>         # Restart one service
```

---

### 🔍 Debug & Monitoring

```bash
docker inspect <container>                # View container details
docker port <container>                   # View exposed ports
docker stats                              # Live CPU/memory usage
```

---

## 📄 Dockerfile Reference

- Official Docs: https://docs.docker.com/reference/dockerfile/

---

## 📌 Author

**Harish Kumar Nimmala**  
GitHub: [@Harishkumarnimmala](https://github.com/Harishkumarnimmala)

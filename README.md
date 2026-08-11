# Game Over

A static "Game Over" gaming/landing website (welcome page, login/registration page, and home page) packaged for containerized deployment. The project ships with a **Dockerfile** and **Jenkinsfile** to build and run the site as an automated CI/CD pipeline, served via **Nginx**.

## Project Structure

```
Game_Over/
├── Dockerfile          # Builds an Nginx image and serves the static site
├── Jenkinsfile         # CI/CD pipeline definition for Jenkins
├── README.md
└── template/            # Static web assets
    ├── index.html       # Landing/welcome page
    ├── Login.html        # Login / registration page
    ├── Home.html          # Home page (after login)
    └── assets/            # CSS, JS, images, fonts, and third-party vendor libraries
```

## Tech Stack

- **Frontend:** HTML5, CSS3, JavaScript, jQuery
- **Web server:** Nginx (via Docker)
- **Containerization:** Docker
- **CI/CD:** Jenkins (declarative pipeline)

## Getting Started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) installed locally
- (Optional) [Jenkins](https://www.jenkins.io/) with Docker installed on the build agent, for running the automated pipeline

### Run Locally with Docker

Clone the repository:

```bash
git clone https://github.com/harikrishnan-knr/Game_Over.git
cd Game_Over
```

Build the Docker image:

```bash
docker build -t game-webapp .
```

Run the container:

```bash
docker run -d --name gameover -p 80:80 game-webapp:latest
```

The site will be available at [http://localhost](http://localhost).

### Run Without Docker

Since this is a static site, you can also open `template/index.html` directly in a browser, or serve the `template/` directory with any static file server, e.g.:

```bash
cd template
python3 -m http.server 8080
```

Then visit [http://localhost:8080](http://localhost:8080).

## CI/CD Pipeline

The included `Jenkinsfile` defines a pipeline that:

1. **Git check** — pulls the latest code from the `main` branch of this repository.
2. **Build** — builds the Docker image (`game-webapp`) from the `Dockerfile`.
3. **Stop Old Container** — stops and removes any previously running container (`gameover`), if present.
4. **Run** — starts a new container from the freshly built image, exposing port `80`.
5. **Post-build notifications** — sends a success or failure email after the pipeline completes.

To use it, create a Jenkins pipeline job pointing at this repository (with Docker available on the build agent), and Jenkins will pick up the `Jenkinsfile` automatically.

## Deployment Notes

- The `Dockerfile` copies the contents of `template/` into Nginx's default web root (`/usr/share/nginx/html`) and exposes port `80`.
- Update the `mail to:` address in the `Jenkinsfile`'s `post` block to receive real build notifications.

## License

No license has been specified for this project. Add a `LICENSE` file if you intend to make usage terms explicit.

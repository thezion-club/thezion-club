# The Zion Club - Xboard Fork

The Zion Club is a powerful and modern panel system for managing proxy protocols, forked from the open-source project [Xboard](https://github.com/cedar2025/Xboard). This project is dedicated to enhancing the original with a focus on performance, user experience, and maintainability.

## Getting Started

The recommended method for setting up this project is by using Docker Compose, which ensures a consistent and reproducible environment.

### 1. Initial Installation

To perform a fresh installation, run the following command from the project's root directory:

```bash
docker compose run -it --rm web sh init.sh
```

This command executes the `init.sh` script within a temporary container to set up the application. The script performs the following actions:

1.  **Downloads Composer:** Fetches the latest version of Composer, the PHP package manager.
2.  **Installs Dependencies:** Installs the required PHP dependencies based on the `composer.lock` file.
3.  **Runs Application Installer:** Executes the `php artisan xboard:install` command to set up the database, run migrations, and create the initial admin user.
4.  **Sets File Permissions:** Adjusts file ownership and permissions to ensure the web server can operate correctly.

After the installation script completes, start all the application services in detached mode:

```bash
docker compose up -d
```

### 2. Updating the Application

To update an existing installation to the latest version, follow these steps:

1.  **Pull the Latest Docker Image:**

    ```bash
    docker compose pull
    ```

2.  **Run the Update Script:**

    ```bash
    docker compose run -it --rm web sh update.sh
    ```

    The `update.sh` script automates the following tasks:
    *   Fetches the latest code from the `master` branch.
    *   Updates PHP dependencies to their latest compatible versions.
    *   Runs database migrations and clears application caches using the `php artisan xboard:update` command.
    *   Resets file permissions for any new or modified files.

3.  **Restart Services:**

    After the update script finishes, restart the services to apply the changes:

    ```bash
    docker compose up -d
    ```

---

## Deployment & CI/CD

This project includes an automated CI/CD workflow using GitHub Actions for building and publishing Docker images to the GitHub Container Registry (`ghcr.io`).

*   **Triggers:** The workflow is automatically triggered on:
    *   A push to the `main` branch.
    *   A push of a tag that starts with `v` (e.g., `v1.0.0`).
*   **Process:** It builds a `linux/amd64` Docker image, tags it, and pushes it to the registry. The image is also signed with `cosign` for security.
*   **Versioning & Tagging:**
    *   **On `main` push:** The image is tagged with `latest`, the branch name (`main`), and a version tag in the format `YYYYMMDD-<short-sha>`.
    *   **On tag push:** The image is tagged with the Git tag itself (e.g., `v1.0.0`). The application version inside the container is also set to this tag.
*   **Production Deployment:** Deployment to a production environment is a manual process that involves pulling the latest image and running the update script as described in the "Updating the Application" section.

---

## Development

### Coding Style

This project adheres to the standard Laravel coding style. We encourage you to follow these conventions to maintain code consistency.

### Database Migrations

Database schema changes are managed through Laravel's migration system. Migrations are located in the `database/migrations` directory. To create a new migration, you can use the `artisan` command:

```bash
docker compose run -it --rm web php artisan make:migration create_new_table
```

### Testing

The project uses PHPUnit for automated testing. Test files are located in the `tests` directory. You can run the test suite using the following command:

```bash
docker compose run -it --rm web php artisan test
```

---

## Contributing

We welcome contributions from the community! If you'd like to contribute, please follow these steps:

1.  **Fork the repository.**
2.  **Create a new branch** for your feature or bug fix: `git checkout -b feature/your-feature-name`.
3.  **Make your changes** and commit them with clear and descriptive messages.
4.  **Push your changes** to your fork.
5.  **Create a pull request** to the `master` branch of this repository.

Please ensure that your code follows the project's coding style and that all tests pass before submitting a pull request.

---

## Custom Artisan Commands

The project includes several custom Artisan commands to facilitate common tasks:

| Command                             | Description                                                                      |
| ----------------------------------- | -------------------------------------------------------------------------------- |
| `backup:database`                   | Backs up the database to a local file or Google Cloud Storage.                   |
| `check:commission`                  | Calculates and pays out commissions for invited users.                           |
| `check:order`                       | Checks for pending or processing orders and dispatches a job to handle them.     |
| `check:server`                      | Checks for offline servers and sends a notification via Telegram.                |
| `check:ticket`                      | Closes tickets that have been inactive for 24 hours.                             |
| `cleanup:expired-online-status`     | Resets the online status for users who have been inactive for 5 minutes.         |
| `clear:user`                        | Deletes users who have no plan, traffic, or activity.                            |
| `export:v2log`                      | Exports v2ray logs to a CSV file.                                                |
| `hook:list`                         | Lists all available hooks in the system.                                         |
| `migrate:from_v2b`                  | Migrates data from a V2board installation.                                       |
| `reset:log`                         | Clears old logs.                                                                 |
| `reset:password`                    | Resets a user's password.                                                        |
| `reset:traffic`                     | Resets traffic for users.                                                        |
| `reset:user`                        | Resets the security information (token and UUID) for all users.                  |
| `send:remind-mail`                  | Sends reminder emails to users about expiring services or traffic usage.         |
| `test`                              | A test command.                                                                  |
| `xboard:install`                    | Initializes the application, sets up the database, and creates an admin user.    |
| `xboard:rollback`                   | Rolls back the last database migration.                                          |
| `xboard:statistics`                 | Gathers and records statistics.                                                  |
| `xboard:update`                     | Updates the application, runs database migrations, and performs other tasks.     |

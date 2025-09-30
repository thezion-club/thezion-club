This project is a fork of Xboard, a comprehensive and modern panel system designed for managing proxy protocols. The original open-source project can be found at https://github.com/cedar2025/Xboard. This fork, The Zion Club, is dedicated to enhancing the original project by implementing new features, improving performance, and refining the user experience.

## Project Goals

The primary goals of this fork are:

*   **Enhanced Performance:** To optimize the application for speed and efficiency, we leverage technologies like Laravel Octane to deliver a highly responsive user experience.
*   **Modern User Interface:** We are committed to providing a clean, intuitive, and modern user interface for both administrators and users. The admin panel is built with React and Shadcn UI, while the user-facing frontend uses Vue3 and TypeScript.
*   **Extensibility:** We aim to make the project more extensible and easier to customize. This includes developing a robust plugin system and clear development guidelines.
*   **Stability and Reliability:** We prioritize the stability and reliability of the application by following best practices in software development and testing.

## Features

*   **High Performance:** Built on Laravel 12 and accelerated with Laravel Octane for a highly responsive experience.
*   **Modern Admin Interface:** A completely redesigned admin panel built with React, Shadcn UI, and TailwindCSS for a clean, intuitive, and powerful management experience.
*   **User-Friendly Frontend:** A sleek and modern user frontend developed with Vue3, TypeScript, and NaiveUI, providing a seamless experience for end-users.
*   **Docker-Ready:** Simplified and consistent deployment using Docker and Docker Compose for both development and production environments.
*   **Optimized Architecture:** The system architecture has been refined for improved maintainability, scalability, and extensibility.
*   **Comprehensive Feature Set:** Includes a wide range of features for user management, server administration, payment processing, and more.

## Versioning

The application version is determined by the latest Git tag. The "v" prefix is automatically removed from the tag to ensure a consistent format. If no Git tag is available, the version falls back to the commit hash. This ensures that a version is always available, whether for a formal release or a development build.

## Technology Stack

The project is built on a modern technology stack, carefully selected to meet the project's goals:

*   **Backend:** The core of the application is built on **PHP 8.4** and the **Laravel 12** framework. We use **Laravel Octane** to boost performance by serving the application using high-performance application servers like Swoole. **MySQL** is used for the database, and **Redis** is used for caching and queue management.
*   **Admin Panel:** The administrator interface is a single-page application built with **React**, **Shadcn UI**, and **TailwindCSS**. This combination allows for the rapid development of a beautiful and functional user interface.
*   **User Frontend:** The user-facing frontend is built with **Vue3**, **TypeScript**, and **NaiveUI**. This stack was chosen for its performance, developer-friendliness, and rich set of UI components.
*   **Deployment:** The project is designed to be deployed using **Docker** and **Docker Compose**. This ensures a consistent and reproducible deployment environment.

For a detailed project explanation, including building, running, and deployment instructions, please refer to `project.md`.
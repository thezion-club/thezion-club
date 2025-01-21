#/bin/bash
docker compose pull
docker compose down
docker compose run -it --rm xboard php artisan xboard:update
docker compose up -d
docker system prune -af

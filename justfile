default:
    just -l --unsorted

# run manage.py
[group('dev')]
manage +COMMAND:
    uv run manage.py {{COMMAND}}

# format the project code
[group('dev')]
fmt path:
    uv run ruff check --select I --fix {{path}}
    uv run ruff format {{path}}

[group("dev")]
dev-tw:
    docker compose -f .deploy/tailwind/docker-compose.yaml build
    docker compose -f .deploy/tailwind/docker-compose.yaml up

[group("dev")]
build-tw:
    docker compose -f .deploy/tailwind/docker-compose.yaml build
    docker compose -f .deploy/tailwind/docker-compose.yaml run --rm tailwind npx @tailwindcss/cli -i ./src/input.css -o ./output/tailwind.css --minify

build:
    COMPOSE_BAKE=true docker compose build

up:
    docker compose up

run: build up

#!/usr/bin/env bash
# Open a shell inside the web container.
#
# Usage:
#   dev/shell.sh            # bash shell
#   dev/shell.sh django     # Django manage.py shell
#   dev/shell.sh db         # Django dbshell (postgres)

case "${1:-bash}" in
    django)
        docker exec -it web python manage.py shell
        ;;
    db)
        docker exec -it web python manage.py dbshell
        ;;
    bash|"")
        docker exec -it web bash
        ;;
    *)
        echo "Usage: dev/shell.sh [bash|django|db]"
        exit 1
        ;;
esac

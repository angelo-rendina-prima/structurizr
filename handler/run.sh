set -ex

while true; do
    INPUT = $(nc -l -p 6113)
    NAME = $(echo $INPUT | head -n 1)
    CONTENT = $(echo $INPUT | tail -n +2)
    echo $CONTENT > "structurizr/$NAME"

    git add .
    git commit -m "Ciao mamma"
    # git push
done

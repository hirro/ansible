# Docker bash aliases

# Show all running containers
alias dps='docker ps -a --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}\t{{.Ports}}"'

# Show logs for specified container 
alias dlogs=$'docker logs --tail=1000 -f $1'

# Show docker stats
alias dstats=$'docker stats $(docker ps | awk \'{print $NF}\' | grep -v NAMES)'

# Stop all containers
alias dstopall='docker stop $(docker ps -a -q)'

# Start all containers
alias dstartall='docker start $(docker ps -a -q)'

# Stop and remove all containers
alias drmall='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# Remove all unused images
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

# Enter the shell for the provided container (either bash or sh)
d-bash-function() {
    docker exec -it $1 bash
}
alias dbash=d-bash-function
d-sh-function() {
    docker exec -it $1 bash
}
alias dsh=d-sh-function

# Get the IP of the container
dip-function() {
	docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $1
}
alias dip=dip-function

set -e -x

BUILD_DIR='builds'
TEMP_DIR=$BUILD_DIR/`date -u +'%F-%I-%M-%S'`

# NOTE:

# The 'mkdir -p grails-app/migrations' is a temporary workaround for a
# difference in grails behavior in interactive and ssh
# environments. 'grails war' locally runs without problems, and via
# ssh -- complains about missing migrations directory.

# The right way to solve it is to find the difference in environments,
# but I don't have the time now.

ssh ubuntu@54.235.171.104 ". ~/custom-env.sh && mkdir -p $TEMP_DIR && cd $TEMP_DIR && git clone git@github.com:chamarapaul/ClassCartography.git && cd ClassCartography && mkdir -p grails-app/migrations && ./scripts/build-and-deploy.sh"

# intended to be sourced into other scripts to set the git environment varaibles
# GIT_COMMIT, GIT_COMMIT_SHORT, GIT_TAG, GIT_TAG_DATE_BASED, GIT_BRANCH, and BRANCH_NAME.

if [[ -z "$GIT_COMMIT" ]]; then
    export GIT_COMMIT=$(git rev-parse HEAD)
fi
export GIT_COMMIT_SHORT="${GIT_COMMIT:0:9}"
if [[ -z "$GIT_TAG" ]]; then
    export GIT_TAG=$(git describe --tags --exact-match $GIT_COMMIT 2> /dev/null)
fi
if [[ "$GIT_TAG" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}(\.[0-9])?$ ]]; then
    export GIT_TAG_DATE_BASED=true
fi
if [[ -z "$GIT_BRANCH" ]]; then
    export GIT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
    export BRANCH_NAME="$GIT_BRANCH"
    # BRANCH_NAME with "/" replaced with "-"
    export BRANCH_NAME_SAFE="${BRANCH_NAME/\//-}"
fi

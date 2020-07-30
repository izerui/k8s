kubectl get deployment ${1} -n test -o yaml | kubectl replace --force -f -

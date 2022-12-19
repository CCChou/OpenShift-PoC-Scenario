BUILD=$(oc get build -n kafak-app | awk 'NR > 1 {print $2}')
DEPLOYMENT=$(oc get deployment -n kafka-app | awk 'NR > 1 {print $1}')
BUILDCONFIG=$(oc get buildconfig -n kafka-app | awk 'NR > 1 {print $1}')
GENERICSECRET=$(oc get secret -n kafka-app | grep generic | awk '{print $1}')
GITHUBSECRET=$(oc get secret -n kafka-app | grep github | awk '{print $1}')
SERVICE=$(oc get service -n kafka-app | awk 'NR > 1 {print $1}')
ROUTE=$(oc get route -n kafka-app | awk 'NR > 1 {print $1}')
IMAGESTREAM=$(oc get imagestream -n kafka-app | awk 'NR > 1 {print $1}')

oc delete build $BUILD
oc delete deployment $DEPLOYMENT
oc delete buildconfig $BUILDCONFIG
oc delete secret $GENERICSECRET
oc delete secret $GITHUBSECRET
oc delete service $SERVICE
oc delete route $ROUTE
oc delete imagestream $IMAGESTREAM
# /bin/bash

export NAMESPACE=$(oc project -q)

export CLUSTER_NAME=$(oc get kafka -n $NAMESPACE |awk 'NR > 1 {print $1}')

# create ssl jks secret
oc get secret $CLUSTER_NAME-cluster-ca-cert -n $NAMESPACE -o jsonpath='{.data.ca\.crt}' | base64 --decode > ca.crt

oc get secret $CLUSTER_NAME-cluster-ca-cert -n $NAMESPACE -o jsonpath='{.data.ca\.password}' | base64 --decode > ca.password

export CERT_FILE_PATH=ca.crt
export CERT_PASSWORD_FILE_PATH=ca.password
export KEYSTORE_LOCATION=truststore.jks
export PASSWORD=`cat $CERT_PASSWORD_FILE_PATH`

if [ -f $KEYSTORE_LOCATION ]; then
  echo "The truststore.jks exists."
else
  yes "yes" | keytool -keystore $KEYSTORE_LOCATION -alias kafka-cert -import -file ca.crt -storepass $PASSWORD
fi

export TRUSTSTORE_SECRET=$(oc get secret kafka-truststore -n $NAMESPACE |awk 'NR > 1 {print $1}')

if [ -n "$TRUSTSTORE_SECRET" ]; then
  echo "delete existing secret."
  oc delete secret kafka-truststore -n $NAMESPACE;
  oc create secret generic kafka-truststore -n $NAMESPACE --save-config --from-file=truststore.jks=$KEYSTORE_LOCATION --from-literal=password=$PASSWORD
else
  echo "create new secret."
  oc create secret generic kafka-truststore -n $NAMESPACE --from-file=truststore.jks=$KEYSTORE_LOCATION --from-literal=password=$PASSWORD
fi

# create kafka-config configmap
export BOOTSTRAP_SERVER=$(oc get route $CLUSTER_NAME-kafka-secure-bootstrap -o jsonpath='{.spec.host}')
export SECURITY_PROTOCOL=SASL_SSL
export SASL_MECHANISM=SCRAM-SHA-512

export KAFKA_CONFIG=$(oc get configmap kafka-config -n $NAMESPACE |awk 'NR > 1 {print $1}')

if [ -n "$KAFKA_CONFIG" ]; then
  echo "delete existing configmap."
  oc delete configmap kafka-config -n $NAMESPACE;
  oc create configmap kafka-config -n $NAMESPACE --from-literal=bootstrap_server=$BOOTSTRAP_SERVER --from-literal=security_protocol=$SECURITY_PROTOCOL --from-literal=sasl_mechanism=$SASL_MECHANISM
else
  echo "create new configmap."
  oc create configmap kafka-config -n $NAMESPACE --from-literal=bootstrap_server=$BOOTSTRAP_SERVER --from-literal=security_protocol=$SECURITY_PROTOCOL --from-literal=sasl_mechanism=$SASL_MECHANISM
fi
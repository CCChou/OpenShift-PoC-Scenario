oc exec -it my-cluster-kafka-0 \
-- bin/kafka-console-producer.sh \
--bootstrap-server my-cluster-kafka-brokers:9092 \
--topic transaction-records
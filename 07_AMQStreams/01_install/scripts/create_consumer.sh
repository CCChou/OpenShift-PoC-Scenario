oc exec -it my-cluster-kafka-0 \
-- bin/kafka-console-consumer.sh \
--bootstrap-server my-cluster-kafka-brokers:9092 \
--topic transaction-records
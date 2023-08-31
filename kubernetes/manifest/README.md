# K8s Manifest

- This folder contains all kubernetes yaml files that runs IHR.

# Usage

- Run the whole manifest:

```
kubectl apply -R -f ./manifest
```

- To update running objects, edit any manifest file and run:

```
kubectl apply -R -f ./manifest
```

- Delete all objects created:

```
kubectl delete -R -f ./manifest
```

# Components

## Kafka

Kafka is already installed on IHR's out of K8s cluster. An [external service](/kubernetes/manifest/01_kafka/external_service.yml) is used to proxy connection to it.

**Note:**

IHR hosts are configured for Kafka `/etc/hosts`:

```
10.0.1.12 kafka1
10.0.1.13 kafka2
10.0.1.14 kafka3
10.0.1.20 kafka4
10.0.1.33 kafka5
10.0.1.34 kafka6
```

So, DNS lookup is handled locally.


## Configuration

- Contains configurations that pods need (eg, `KAFKA_HOST`).

## Producers

- Contains `CronJob`s of IHR's producers (eg, BGP Producers).

- To run a `CronJob` instantly without waiting for schedule:

```
kubectl create job --from=cronjobs/<job-name>
```

- To follow logs of a running pod/job:

```
kubectl logs pod/<name> -f
```
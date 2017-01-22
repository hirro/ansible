# Running Hazelcast swarm

## Create the network

		docker network create --driver overlay --subnet 10.66.21.0/29 hazelcast-network

Seems to not get propagated to all nodes!


## Run the containers

--mode global is used to start hazelcast on each node on the cluster.


docker service create --mode global --name hazelcast --mount type=bind,source=/opt/hazelcast/hazelcast.xml,target=/opt/hazelcast/hazelcast.xml  --network hazelcast-network hazelcast/hazelcast:3.5.4


docker service create --replicas=3 --name hazelcast --mount type=bind,source=/opt/hazelcast/hazelcast.xml,target=/opt/hazelcast/hazelcast.xml  --network hazelcast-network hazelcast/hazelcast:3.5.4

172.17.0.4/16



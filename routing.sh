#!/bin/bash
echo "from cont-a try to ping cont-b"
echo ""
docker exec cont-a /bin/bash -c "ping -c 1 -W 2 172.166.5.23"
echo ""
echo "from cont-b try to ping cont-a"
echo ""
docker exec cont-b /bin/bash -c "ping -c 1 -W 2 172.155.7.12"
echo ""
echo "does not work."
echo ""
echo "let's see cont-a neighbours..."
echo ""
docker exec cont-a /bin/bash -c "ip neigh show"
echo ""
echo "let's see cont-b neighbours..."
echo ""
docker exec cont-b /bin/bash -c "ip neigh show"
echo ""
echo "let's add some routing rules and try again..."
echo ""
echo "adding this rule to cont-a: ip route add 172.166.0.0/16 via 172.155.10.10"
docker exec cont-a /bin/bash -c "ip route add 172.166.0.0/16 via 172.155.10.10"
echo "adding this rule to cont-b: ip route add 172.155.0.0/16 via 172.166.20.20"
docker exec cont-b /bin/bash -c "ip route add 172.155.0.0/16 via 172.166.20.20"
echo ""
echo "from cont-a ping cont-b"
echo ""
docker exec cont-a /bin/bash -c "ping -c 1 -W 2 172.166.5.23"
echo ""
echo "from cont-b ping cont-a"
echo ""
docker exec cont-b /bin/bash -c "ping -c 1 -W 2 172.155.7.12"
echo ""
echo "it should work :P"

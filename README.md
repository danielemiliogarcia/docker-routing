# Simple network using docker, and a script that adds routes for routing to work
```
┌────────────┐                   ┌─────────────┐                     ┌────────────┐
│   cont-a   │                   │ cont-router │                     │   cont-b   │
└────────────┘                   └─────────────┘                     └────────────┘
      ├──────────────────────────────┼  .  ┼─────────────────────────────────┼
❰172.155.7.12❱         ❰172.155.10.10❱  .  ❰172.166.20.20❱             ❰172.166.5.23❱
                                        .
                                        .
              test-neta                 .                  test-netb
                                        .
            172.155.0.0/16              .                172.166.0.0/16
                                        .


```

# How to run

```
docker-compose up
```

1) Put up the docker compose stack (add -d if you want it in detached mode)
```bash
docker-compose up
```

1) Run the POC script
```bash
./routing.sh
```

# Cleanup

## After using this, you should remove created networks, and containers

Remove containers and networks
```bash
`docker-compose down`
```

Remove containers
```bash
`docker-compose rm`
```

### 1. Docker Compose 部署

```bash
services:
  istoreos:
    image: kwonelee/istoreos-docker:latest
    container_name: istoreos
    privileged: true
    restart: always
    networks:
      istoreos_macnet: 
    command: /sbin/init

networks:
  istoreos_macnet:
    name: istoreos_macnet
    driver: macvlan
    driver_opts:
      # 这里替换为你设备的网卡名称（如eth0、end0、enp1s0、enp1s0-ovs等）ip link show可查；不支持无线网卡
      parent: end0
    ipam:
      config:
        - subnet: 192.168.5.0/24 # 这里换成你的NAS所在的网段(比如192.168.5.0/24)
          gateway: 192.168.5.1 # 这里换成你的NAS所在的网关（比如192.168.5.1）
```

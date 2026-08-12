<div align="center">
  <h1>✨ 轻量级 OpenWrt Docker 镜像 ✨</h1>

  <img src="https://img.shields.io/github/downloads/Kwonelee/openwrt-docker/total.svg?style=for-the-badge&color=32C955"/>
  <img src="https://img.shields.io/github/stars/Kwonelee/openwrt-docker.svg?style=for-the-badge&color=orange"/>
  <img src="https://img.shields.io/github/forks/Kwonelee/openwrt-docker.svg?style=for-the-badge&color=ff69b4"/>
  <img src="https://img.shields.io/github/license/Kwonelee/openwrt-docker.svg?style=for-the-badge&color=blueviolet"/>
</div>

---

## 🤔 项目介绍
**OpenWrt Docker** 是基于 imagebuilder 精简构建的轻量级容器镜像，开箱即跑，资源占用极低

> [!TIP]
> 😂此固件为 **非官方构建，不保证完全无BUG** ，请知悉😂
> 
> 使用此仓库必须设置机密token，Actions云构建固件时需要用到，通常在仓库设置里面。机密键名为 **`GH_TOKEN`**（严禁在仓库可视代码中填写，否则后果自负）

---

## 😅 Docker Compose 部署

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

<details>
  <summary>openwrt-docker部署</summary>

```bash
services:
  openwrt:
    image: kwonelee/openwrt-docker:latest
    container_name: openwrt
    privileged: true
    restart: always
    networks:
      openwrt_macnet: 
    command: /sbin/init

networks:
  openwrt_macnet:
    name: openwrt_macnet
    driver: macvlan
    driver_opts:
      # 这里替换为你设备的网卡名称（如eth0、end0、enp1s0、enp1s0-ovs等）ip link show可查；不支持无线网卡
      parent: end0
    ipam:
      config:
        - subnet: 192.168.5.0/24 # 这里换成你的NAS所在的网段(比如192.168.5.0/24)
          gateway: 192.168.5.1 # 这里换成你的NAS所在的网关（比如192.168.5.1）
```
</details>

## 🌟 Star戳一戳，好运加满！😆
> **"点过 `Star` 的朋友，颜值与智慧双双在线！✨"**
> 
> **"您的每一个⭐️，都是开源土壤里的一缕阳光，让灵感发芽，让创造生长~"**

## 🙏 免责声明
- 📚 本固件仅供学习研究，严禁用于任何商业用途
- 🤝 使用本固件产生的所有后果均由使用者自行承担
- ⚠️ 固件仍可能存在缺陷，开发者不提供任何形式的技术支持
- 📜 请严格遵守国家网络安全法律法规，合法使用

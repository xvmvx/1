#!/bin/bash
docker run -d --restart unless-stopped --stop-timeout 300 \
	--name trilium \
	-p 18080:8080 \
	-v /dockers/trilium:/home/node/trilium-data \
	-v /dockers/trilium/backup:/home/node/trilium-data/backup \
	-e TZ=Asia/Shanghai \
zadam/trilium:0.54.3

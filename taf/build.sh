#!/bin/bash
curl -O http://mirrors.aliyun.com/repo/Centos-7.repo
curl -O http://mirrors.163.com/.help/CentOS7-Base-163.repo
docker build -t tafdev:0.0.1 .

# 基于机器学习的流量加密识别

## 环境

|              |                                 |
| ------------ | ------------------------------- |
| 系统与发行版 | Linux 5.15.154-1-MANJARO x86_64 |
| chrome       | 114.0.5735.106                  |
| chrome drive | 114.0.5735.90                   |
| python       | 3.11.5                          |

## 采集目标

https://bbs.elecfans.com（电子发烧友论坛）

https://www.qimao.com（七猫小说）

https://blog.csdn.net（CSDN论坛）

https://bbs.kanxue.com（看雪论坛）

http://www.news.cn（新华网）

https://my.4399.com（4399小游戏）

https://www.3dmgame.com（3dm单机游戏论坛）

http://www.7k7k.com（7k7k小游戏）

https://www.haodf.com（好大夫）

https://dxy.com（丁香花医生）

## 文件说明

get_flows.ipynb —— 生成 .pcap 文件（在目录 pcap_data 下）、将 pcap 转换为 json（json_data.json）

feature_extraction.ipynb —— 提取流量的特征值，生成 dataset.csv

## 使用

### 采集流量

1. 所需依赖：chrome driver（须与 chrome 版本匹配）， tshark

2. 添加 head

   ```python
   header={'User-Agent':'','Referer':''}
   ```

3. 更改网卡设备

   ```python
   tshark_command = [
        "sudo",
        "tshark",
        "-i",
        "wlp4s0",#改为自己的网卡设备名称
        "-w",
        file_name,
        "-f",
        f'host {url.split("//")[1]}',
    ]
   ```

4. 需要配置 sudo 免密，因为 tshark 启动需要 root 权限，而 subprocess 调用 tshark 无法输入密码（也可以使用 sudo -S，传入密码）
5. 运行，本人大概运行 4h 采集完毕

### 提取特征值

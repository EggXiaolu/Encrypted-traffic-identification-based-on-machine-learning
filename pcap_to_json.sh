#!/bin/bash

# 定义包含 .pcap 文件的目录
PCAP_DIR="pcap_data"

# 定义输出的 JSON 文件
OUTPUT_JSON="json_data.json"

# 初始化 JSON 输出文件
echo "[" > $OUTPUT_JSON

# 处理目录中的每个 .pcap 文件
for pcap_file in "$PCAP_DIR"/*.pcap; do
  # 使用 tshark 将 .pcap 文件转换为 JSON 并追加到输出文件
  tshark -r "$pcap_file" -T json >> $OUTPUT_JSON
  echo "," >> $OUTPUT_JSON  # 添加逗号以分隔 JSON 对象
done

# 删除最后一个逗号并关闭 JSON 数组
sed -i '$ s/,$//' $OUTPUT_JSON
echo "]" >> $OUTPUT_JSON


#!/bin/bash

# 定义包含 .pcap 文件的目录
PCAP_DIR="pcap_data"

# 定义输出 JSON 文件的目录
OUTPUT_DIR="json_data"

# 确保输出目录存在
mkdir -p $OUTPUT_DIR

# 处理目录中的每个 .pcap 文件
for pcap_file in "$PCAP_DIR"/*.pcap; do
  # 获取文件名（不包括扩展名）
  base_name=$(basename "$pcap_file" .pcap)
  
  # 定义输出 JSON 文件路径
  output_json="$OUTPUT_DIR/$base_name.json"

  # 使用 tshark 将 .pcap 文件转换为 JSON 并保存到输出文件
  tshark -r "$pcap_file" -T json > "$output_json"
done

echo "PCAP to JSON conversion completed. Files saved in $OUTPUT_DIR"

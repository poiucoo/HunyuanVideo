# 使用 CUDA 12.1 的 Python 環境
FROM nvidia/cuda:12.1.1-runtime-ubuntu22.04

# 設定工作目錄
WORKDIR /app

# 安裝必要系統套件
RUN apt update && apt install -y git python3 python3-pip ffmpeg && rm -rf /var/lib/apt/lists/*

# 複製專案內容進容器
COPY . .

# 安裝 Python 依賴
RUN pip install --upgrade pip && pip install -r requirements.txt

# 暴露埠號
EXPOSE 3000

# 啟動指令（RunPod 會從這裡啟動 Gradio 介面）
CMD ["python3", "gradio_server.py", "--port", "3000"]

import runpod
import subprocess

# 啟動 HunyuanVideo 的推論伺服器
def run_hunyuan_video(job):
    input_data = job["input"]
    prompt = input_data.get("prompt", "Generate a short talking person video")

    print(f"🟢 Received prompt: {prompt}")
    # 啟動 Gradio 或主推論程式
    subprocess.Popen(["python3", "gradio_server.py", "--port", "3000"])

    return {"status": "started", "prompt": prompt}

# 啟動 RunPod Handler
runpod.serverless.start({"handler": run_hunyuan_video})

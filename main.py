from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello World"}

# Step1. Postでrequest bodyに受け取ったら、responseに詰めるAPIを作成せよ
# Step2. 受け取ったデータをDBに格納せよ


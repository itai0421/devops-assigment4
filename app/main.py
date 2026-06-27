from fastapi import FastAPI
from pydantic import BaseModel

# יוצרים אפליקציית FastAPI
app = FastAPI()

# מודל לקליטת JSON ב־POST
class EchoModel(BaseModel):
    message: str

# GET / — מחזיר טקסט פשוט
@app.get("/")
def root():
    return {"message": "Hello, DevOps!"}

# POST /echo — מחזיר את ה־JSON שנשלח
@app.post("/echo")
def echo(data: EchoModel):
    return {"echo": data.message}

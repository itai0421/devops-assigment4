from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

# בדיקה ל־GET /
def test_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, DevOps!"}

# בדיקה ל־POST /echo
def test_echo():
    response = client.post("/echo", json={"message": "test"})
    assert response.status_code == 200
    assert response.json() == {"echo": "test"}

import pytest
from app import app

@pytest.fixture
def client():
    app.testing = True
    with app.test_client() as client:
        yield client

def test_home_endpoint(client):
    response = client.get("/")
    assert response.status_code == 200
    assert b"Hello from Python CI/CD on EKS!" in response.data

def test_health_endpoint(client):
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json == {"status": "ok"}

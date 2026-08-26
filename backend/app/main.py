import sys
from pathlib import Path
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

# Garantir que a pasta app seja encontrada pelo Python
sys.path.insert(0, str(Path(__file__).resolve().parent))

app = FastAPI(
    title="TempoAlerta API",
    description="API para previsão do tempo e alertas meteorológicos",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/", tags=["Status"])
def read_root():
    return {"status": "online", "app": "TempoAlerta"}

@app.get("/health", tags=["Status"])
def health_check():
    return {"status": "ok"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)
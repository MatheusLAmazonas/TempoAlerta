# app/main.py

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from contextlib import asynccontextmanager

from app.config.database import engine, Base
from app.routers import usuarios, cidades, preferencias, alertas


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Executado na inicialização do servidor
    print("Iniciando TempoAlerta API...")
    # Cria as tabelas no banco caso não existam (ideal usar Alembic em produção,
    # mas facilita nos testes iniciais do projeto)
    Base.metadata.create_all(bind=engine)
    yield
    # Executado no encerramento do servidor
    print("Encerrando TempoAlerta API...")


app = FastAPI(
    title="TempoAlerta API",
    description="API para previsão do tempo e alertas meteorológicos (chuva forte e geada)",
    version="1.0.0",
    lifespan=lifespan,
)

# Libera acesso do app mobile (Flutter) à API
# Em produção, restrinja allow_origins para os domínios/IPs reais
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Registro das rotas
app.include_router(usuarios.router, prefix="/usuarios", tags=["Usuários"])
app.include_router(cidades.router, prefix="/cidades", tags=["Cidades"])
app.include_router(preferencias.router, prefix="/preferencias", tags=["Preferências"])
app.include_router(alertas.router, prefix="/alertas", tags=["Alertas Enviados"])


@app.get("/", tags=["Status"])
def read_root():
    return {"status": "online", "app": "TempoAlerta"}


@app.get("/health", tags=["Status"])
def health_check():
    return {"status": "ok"}
from sqlalchemy import create_engine
from sqlalchemy.orm import DeclarativeBase, sessionmaker

# URL de conexão com o PostgreSQL
DATABASE_URL = "postgresql+psycopg://postgres:postgres@localhost:5432/tempoalerta"

# Cria a conexão com o banco
engine = create_engine(
    DATABASE_URL,
    echo=True
)


# Cria as sessões utilizadas para conversar com o banco
SessionLocal = sessionmaker(
    bind=engine,
    autoflush=False,
    autocommit=False
)


# Classe base dos nossos modelos
class Base(DeclarativeBase):
    pass


# Dependência para utilizar uma sessão do banco nas rotas
def get_db():
    db = SessionLocal()

    try:
        yield db
    finally:
        db.close()
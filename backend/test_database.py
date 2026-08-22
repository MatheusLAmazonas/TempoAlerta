from sqlalchemy import text

from app.config.database import engine


with engine.connect() as connection:
    resultado = connection.execute(text("SELECT 1"))
    print(resultado.scalar())
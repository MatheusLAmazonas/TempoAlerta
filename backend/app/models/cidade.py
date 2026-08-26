from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.database import Base


class Cidade(Base):
    __tablename__ = "cidades"

    id: Mapped[int] = mapped_column(
        primary_key=True
    )

    nome: Mapped[str] = mapped_column(
        String(100),
        nullable=False
    )

    estado: Mapped[str] = mapped_column(
        String(2),
        nullable=False
    )

    latitude: Mapped[float | None] = mapped_column(
        nullable=True
    )

    longitude: Mapped[float | None] = mapped_column(
        nullable=True
    )

    usuarios = relationship(
        "Usuario",
        back_populates="cidade"
    )

    alertas = relationship(
        "Alerta",
        back_populates="cidade"
    )

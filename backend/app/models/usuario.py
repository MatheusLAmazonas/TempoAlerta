from sqlalchemy import ForeignKey, String
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.database import Base


class Usuario(Base):
    __tablename__ = "usuarios"

    id: Mapped[int] = mapped_column(
        primary_key=True
    )

    nome: Mapped[str] = mapped_column(
        String(100),
        nullable=False
    )

    email: Mapped[str] = mapped_column(
        String(255),
        unique=True,
        nullable=False,
        index=True
    )

    cidade_id: Mapped[int | None] = mapped_column(
        ForeignKey("cidades.id"),
        nullable=True
    )

    cidade = relationship(
        "Cidade",
        back_populates="usuarios"
    )

    preferencias = relationship(
        "Preferencia",
        back_populates="usuario",
        cascade="all, delete-orphan"
    )

    alertas = relationship(
        "Alerta",
        back_populates="usuario",
        cascade="all, delete-orphan"
    )

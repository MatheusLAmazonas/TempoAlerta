from datetime import datetime

from sqlalchemy import Boolean, ForeignKey, String, Text
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.database import Base


class Alerta(Base):
    __tablename__ = "alertas"

    id: Mapped[int] = mapped_column(
        primary_key=True
    )

    usuario_id: Mapped[int] = mapped_column(
        ForeignKey("usuarios.id"),
        nullable=False
    )

    cidade_id: Mapped[int] = mapped_column(
        ForeignKey("cidades.id"),
        nullable=False
    )

    titulo: Mapped[str] = mapped_column(
        String(150),
        nullable=False
    )

    mensagem: Mapped[str] = mapped_column(
        Text,
        nullable=False
    )

    tipo: Mapped[str] = mapped_column(
        String(50),
        nullable=False
    )

    lido: Mapped[bool] = mapped_column(
        Boolean,
        default=False,
        nullable=False
    )

    criado_em: Mapped[datetime] = mapped_column(
        default=datetime.utcnow,
        nullable=False
    )

    usuario = relationship(
        "Usuario",
        back_populates="alertas"
    )

    cidade = relationship(
        "Cidade",
        back_populates="alertas"
    )

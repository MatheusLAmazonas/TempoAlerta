from sqlalchemy import Boolean, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.database import Base


class Preferencia(Base):
    __tablename__ = "preferencias"

    id: Mapped[int] = mapped_column(
        primary_key=True
    )

    usuario_id: Mapped[int] = mapped_column(
        ForeignKey("usuarios.id"),
        nullable=False
    )

    temperatura_min: Mapped[float | None] = mapped_column(
        nullable=True
    )

    temperatura_max: Mapped[float | None] = mapped_column(
        nullable=True
    )

    umidade_min: Mapped[float | None] = mapped_column(
        nullable=True
    )

    umidade_max: Mapped[float | None] = mapped_column(
        nullable=True
    )

    chuva: Mapped[bool] = mapped_column(
        Boolean,
        default=False,
        nullable=False
    )

    vento_forte: Mapped[bool] = mapped_column(
        Boolean,
        default=False,
        nullable=False
    )

    ativa: Mapped[bool] = mapped_column(
        Boolean,
        default=True,
        nullable=False
    )

    usuario = relationship(
        "Usuario",
        back_populates="preferencias"
    )

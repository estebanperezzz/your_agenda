-- CreateTable
CREATE TABLE "Usuario" (
    "id" TEXT NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "google_id" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TipoUsuario" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "TipoUsuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsuarioTipoUsuario" (
    "id" SERIAL NOT NULL,
    "usuario_id" TEXT,
    "tipo_usuario_id" INTEGER,

    CONSTRAINT "UsuarioTipoUsuario_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Local" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "telefono" TEXT,
    "direccion" TEXT,

    CONSTRAINT "Local_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Servicio" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Servicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LocalServicio" (
    "id" SERIAL NOT NULL,
    "local_id" INTEGER,
    "servicio_id" INTEGER,

    CONSTRAINT "LocalServicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrabajadorServicio" (
    "id" SERIAL NOT NULL,
    "usuario_id" TEXT,
    "servicio_id" INTEGER,

    CONSTRAINT "TrabajadorServicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TrabajadorLocalServicio" (
    "id" SERIAL NOT NULL,
    "trabajador_servicio_id" INTEGER,
    "local_id" INTEGER,

    CONSTRAINT "TrabajadorLocalServicio_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HorarioDisponible" (
    "id" SERIAL NOT NULL,
    "trabajador_local_servicio_id" INTEGER,
    "dia_semana" TEXT NOT NULL,
    "hora_inicio" TIMESTAMP(3) NOT NULL,
    "hora_fin" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HorarioDisponible_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Reserva" (
    "id" SERIAL NOT NULL,
    "cliente_id" TEXT,
    "horario_disponible_id" INTEGER,
    "fecha_reserva" TIMESTAMP(3) NOT NULL,
    "estado" TEXT,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Reserva_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_google_id_key" ON "Usuario"("google_id");

-- AddForeignKey
ALTER TABLE "UsuarioTipoUsuario" ADD CONSTRAINT "UsuarioTipoUsuario_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UsuarioTipoUsuario" ADD CONSTRAINT "UsuarioTipoUsuario_tipo_usuario_id_fkey" FOREIGN KEY ("tipo_usuario_id") REFERENCES "TipoUsuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocalServicio" ADD CONSTRAINT "LocalServicio_local_id_fkey" FOREIGN KEY ("local_id") REFERENCES "Local"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LocalServicio" ADD CONSTRAINT "LocalServicio_servicio_id_fkey" FOREIGN KEY ("servicio_id") REFERENCES "Servicio"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrabajadorServicio" ADD CONSTRAINT "TrabajadorServicio_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrabajadorServicio" ADD CONSTRAINT "TrabajadorServicio_servicio_id_fkey" FOREIGN KEY ("servicio_id") REFERENCES "Servicio"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrabajadorLocalServicio" ADD CONSTRAINT "TrabajadorLocalServicio_trabajador_servicio_id_fkey" FOREIGN KEY ("trabajador_servicio_id") REFERENCES "TrabajadorServicio"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TrabajadorLocalServicio" ADD CONSTRAINT "TrabajadorLocalServicio_local_id_fkey" FOREIGN KEY ("local_id") REFERENCES "Local"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HorarioDisponible" ADD CONSTRAINT "HorarioDisponible_trabajador_local_servicio_id_fkey" FOREIGN KEY ("trabajador_local_servicio_id") REFERENCES "TrabajadorLocalServicio"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reserva" ADD CONSTRAINT "Reserva_cliente_id_fkey" FOREIGN KEY ("cliente_id") REFERENCES "Usuario"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reserva" ADD CONSTRAINT "Reserva_horario_disponible_id_fkey" FOREIGN KEY ("horario_disponible_id") REFERENCES "HorarioDisponible"("id") ON DELETE SET NULL ON UPDATE CASCADE;

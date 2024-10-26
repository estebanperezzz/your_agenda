// prisma/seed.ts
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  await prisma.tipoUsuario.createMany({
    data: [
      { nombre: 'Local' },
      { nombre: 'Trabajador' },
      { nombre: 'Cliente' },
    ],
  });

  await prisma.servicio.createMany({
    data: [
      { nombre: 'Barbería' },
      { nombre: 'Peluquería Femenina' },
      { nombre: 'Masajes' },
      { nombre: 'Lashitas' },
      { nombre: 'Depilación' },
      { nombre: 'Manicura' },
      { nombre: 'Tatuajes' },
    ],
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });

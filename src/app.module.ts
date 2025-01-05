import { Module } from '@nestjs/common';
import { TicketsModule } from './tickets/tickets.module';
import { PrismaService } from './prisma/prisma.service';

@Module({
  imports: [TicketsModule],
  controllers: [],
  providers: [PrismaService],
})
export class AppModule {}

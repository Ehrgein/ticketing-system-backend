import { Module } from '@nestjs/common';
import { TicketsModule } from './tickets/tickets.module';
import { PrismaService } from './prisma/prisma.service';
import { PurchasesModule } from './purchases/purchases.module';

@Module({
  imports: [TicketsModule, PurchasesModule],
  controllers: [],
  providers: [PrismaService],
})
export class AppModule {}

import { Module } from '@nestjs/common';
import { TicketsModule } from './tickets/tickets.module';
import { PrismaService } from './prisma/prisma.service';
import { PurchasesModule } from './purchases/purchases.module';
import { EventsModule } from './events/events.module';

@Module({
  imports: [TicketsModule, PurchasesModule, EventsModule],
  controllers: [],
  providers: [PrismaService],
})
export class AppModule {}

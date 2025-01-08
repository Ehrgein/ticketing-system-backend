import {
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { CreateTicketDto } from './dto/create-ticket.dto';
import { UpdateTicketDto } from './dto/update-ticket.dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { Prisma } from '@prisma/client';

@Injectable()
export class TicketsService {
  constructor(private prismaService: PrismaService) {}

  async create(createTicketDto: CreateTicketDto) {
    const {
      event_time_id,
      purchaser_id,
      event_id,
      seat_location,
      price_per_ticket,
      payer_email,
      payer_id,
      payer_firstName,
      payer_lastName,
      identification_num,
      identification_type,
      quantity,
    } = createTicketDto;

    const tickets = [];

    const purchase = await this.prismaService.purchases.create({
      data: {
        purchaser_id,
        event_time_id,
        total_quantity: quantity,
        total_price: price_per_ticket * quantity,
      },
    });

    try {
      for (let i = 0; i < createTicketDto.quantity; i++) {
        const ticket = await this.prismaService.tickets.create({
          data: {
            event_time_id,
            purchaser_id,
            event_id,
            seat_location,
            price_per_ticket,
            payer_email,
            payer_id,
            payer_firstName,
            payer_lastName,
            identification_num,
            identification_type,
            purchase_id: purchase.purchase_id,
          },
        });

        tickets.push(ticket);
      }

      console.log(purchase);

      console.log('total of tickets', tickets);

      return tickets;
    } catch (error) {
      // if (error instanceof Prisma.PrismaClientKnownRequestError) {
      //   if (error.code === 'P2002') {
      //     throw new ConflictException(
      //       `Ticket with the same ${createTicketDto.email} already exists`,
      //     );
      //   }
      // }
      console.log(error);
    }
  }

  findAll() {
    return this.prismaService.tickets.findMany();
  }

  async findOne(id: number) {
    const ticketFound = await this.prismaService.tickets.findUnique({
      where: {
        ticket_id: id,
      },
    });

    if (!ticketFound) {
      throw new NotFoundException(`Ticket with ID ${id} not found`);
    }

    return ticketFound;
  }

  async update(id: number, updateTicketDto: UpdateTicketDto) {
    const productUpdated = await this.prismaService.tickets.update({
      where: {
        ticket_id: id,
      },
      data: updateTicketDto,
    });

    if (!productUpdated) {
      throw new NotFoundException(`Ticket with ID ${id} not found`);
    }

    return productUpdated;
  }

  async remove(id: number) {
    const deletedTicket = await this.prismaService.tickets.delete({
      where: {
        ticket_id: id,
      },
    });

    if (!deletedTicket) {
      throw new NotFoundException(`Ticket with ID ${id} not found`);
    }

    return deletedTicket;
  }
}

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
    try {
      return await this.prismaService.tickets.create({
        data: createTicketDto,
      });
    } catch (error) {
      if (error instanceof Prisma.PrismaClientKnownRequestError) {
        if (error.code === 'P2002') {
          throw new ConflictException(
            `Ticket with the same ${createTicketDto.email} already exists`,
          );
        }
      }
    }
  }

  findAll() {
    return this.prismaService.tickets.findMany();
  }

  async findOne(id: number) {
    const ticketFound = await this.prismaService.tickets.findUnique({
      where: {
        id: id,
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
        id: id,
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
        id: id,
      },
    });

    if (!deletedTicket) {
      throw new NotFoundException(`Ticket with ID ${id} not found`);
    }

    return deletedTicket;
  }
}

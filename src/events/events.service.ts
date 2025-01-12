import { Injectable } from '@nestjs/common';
import { CreateEventDto } from './dto/create-event.dto';
import { UpdateEventDto } from './dto/update-event.dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class EventsService {
  constructor(private prismaService: PrismaService) {}

  create(createEventDto: CreateEventDto) {
    console.log(createEventDto);

    const eventInfoData = createEventDto.datetime.map((datetime) => ({
      datetime: new Date(datetime), // Convert ISO string to Date object
      price_per_ticket: createEventDto.price_per_ticket, // Price per ticket
      ticket_availability: createEventDto.ticket_availability, // Ticket availability
      location: createEventDto.location, // Location
      status: 'scheduled', // Default status
    }));

    return this.prismaService.events.create({
      data: {
        event_name: createEventDto.event_name,
        description: createEventDto.description,
        location: createEventDto.location,
        event_info: {
          create: eventInfoData,
        },
      },
    });
  }

  findAll() {
    return this.prismaService.events.findMany({
      include: {
        event_info: true,
      },
    });
  }

  findOne(id: number) {
    return this.prismaService.events.findUnique({
      where: { event_id: id },
      include: {
        event_info: {
          include: {
            tickets: true,
          },
        },
      },
    });
  }

  update(id: number, updateEventDto: UpdateEventDto) {
    return `This action updates a #${id} event`;
  }

  remove(id: number) {
    return `This action removes a #${id} event`;
  }
}

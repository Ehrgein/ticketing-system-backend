import { Events } from '@prisma/client';

export type CreateEventDto = {
  event_name: string;
  description: string;
  location: string;
  price_per_ticket: number;
  ticket_availability: number;
  datetime: string[]; // Array of ISO datetime strings
};

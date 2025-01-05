// export class CreateTicketDto {}

import { Tickets } from '@prisma/client';

export type CreateTicketDto = Omit<Tickets, 'id' | 'createdAt' | 'updatedAt'>;

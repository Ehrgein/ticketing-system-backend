import { Purchases } from '@prisma/client';

export type CreatePurchaseDto = Omit<
  Purchases,
  'id' | 'createdAt' | 'updatedAt'
>;

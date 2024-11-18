import { z } from "zod";

export const iotaInitShareSchema = z.object({
  configurationId: z.string(),
  queryId: z.string(),
  redirectUri: z.string(),
  nonce: z.string(),
});

export const iotaResponseSchema = z.object({
  configurationId: z.string(),
  correlationId: z.string(),
  transactionId: z.string(),
  responseCode: z.string(),
});
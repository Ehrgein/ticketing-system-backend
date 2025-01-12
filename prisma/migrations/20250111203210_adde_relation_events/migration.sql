-- AddForeignKey
ALTER TABLE "Tickets" ADD CONSTRAINT "Tickets_event_time_id_fkey" FOREIGN KEY ("event_time_id") REFERENCES "EventInfo"("event_info_id") ON DELETE RESTRICT ON UPDATE CASCADE;

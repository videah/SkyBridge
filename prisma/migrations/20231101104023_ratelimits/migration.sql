-- CreateTable
CREATE TABLE "AuthRateLimit" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ip_address" TEXT NOT NULL,
    "attempts" INTEGER NOT NULL DEFAULT 0,
    "last_attempt" DATETIME
);

-- CreateIndex
CREATE UNIQUE INDEX "AuthRateLimit_ip_address_key" ON "AuthRateLimit"("ip_address");

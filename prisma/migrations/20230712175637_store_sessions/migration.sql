-- CreateTable
CREATE TABLE "SessionRecord" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "did" TEXT NOT NULL,
    "session" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "SessionRecord_did_key" ON "SessionRecord"("did");

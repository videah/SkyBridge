-- CreateTable
CREATE TABLE "UserRecord" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "did" TEXT NOT NULL,
    "banner" TEXT NOT NULL DEFAULT '',
    "followers_count" INTEGER NOT NULL DEFAULT 0,
    "follows_count" INTEGER NOT NULL DEFAULT 0,
    "posts_count" INTEGER NOT NULL DEFAULT 0,
    "description" TEXT NOT NULL DEFAULT ''
);

-- CreateTable
CREATE TABLE "PostRecord" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "cid" TEXT NOT NULL,
    "uri" TEXT NOT NULL,
    "author_did" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "RepostRecord" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "hash_id" TEXT NOT NULL,
    "original_post_id" BIGINT NOT NULL,
    CONSTRAINT "RepostRecord_original_post_id_fkey" FOREIGN KEY ("original_post_id") REFERENCES "PostRecord" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "NotificationRecord" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "cid" TEXT NOT NULL,
    "uri" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "MediaRecord" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "type" TEXT NOT NULL,
    "mime_type" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "link" TEXT NOT NULL,
    "description" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "FeedRecord" (
    "id" BIGINT NOT NULL PRIMARY KEY,
    "cid" TEXT NOT NULL,
    "uri" TEXT NOT NULL,
    "author_did" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "UserRecord_did_key" ON "UserRecord"("did");

-- CreateIndex
CREATE UNIQUE INDEX "PostRecord_cid_key" ON "PostRecord"("cid");

-- CreateIndex
CREATE UNIQUE INDEX "RepostRecord_hash_id_key" ON "RepostRecord"("hash_id");

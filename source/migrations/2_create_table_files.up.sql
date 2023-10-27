CREATE TABLE files (
    id UUID PRIMARY KEY NOT NULL DEFAULT uuid_generate_v4(),
    "name" VARCHAR NOT NULL,
    extension VARCHAR NOT NULL,
    size_bytes INTEGER NOT NULL,
    bucket VARCHAR NOT NULL,
    "key" VARCHAR NOT NULL,
    checksum_md5 VARCHAR NOT NULL,
    deleted_at TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),

    UNIQUE(checksum_md5)
);
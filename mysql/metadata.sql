CREATE TABLE `metadata` (
    `repository_reference_uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `key` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
    `val` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
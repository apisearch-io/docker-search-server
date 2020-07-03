CREATE TABLE `tokens` (
    `token_uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `app_uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
    `content` text COLLATE utf8_unicode_ci NOT NULL,
    PRIMARY KEY (`token_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE `usage_lines` (
    `event` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
    `app_uuid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `index_uuid` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
    `time` int(11) NOT NULL,
    `n` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
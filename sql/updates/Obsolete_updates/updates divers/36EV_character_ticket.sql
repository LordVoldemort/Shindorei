DROP TABLE IF EXISTS `gm_tickets`;

--
-- Table structure for table `character_ticket`
--

DROP TABLE IF EXISTS `character_ticket`;
CREATE TABLE `character_ticket` (
  `ticket_id` int(11) unsigned NOT NULL auto_increment,
  `guid` int(11) unsigned NOT NULL default '0',
  `ticket_text` text,
  `ticket_lastchange` TIMESTAMP ON  UPDATE  CURRENT_TIMESTAMP  NOT  NULL  DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player System';

--
-- Dumping data for table `character_ticket`
--

LOCK TABLES `character_ticket` WRITE;
/*!40000 ALTER TABLE `character_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_ticket` ENABLE KEYS */;
UNLOCK TABLES;

alter table `character_ticket`
    add column `response_text` text CHARSET utf8 COLLATE utf8_general_ci NULL after `ticket_text`;
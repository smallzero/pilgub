--
-- Database: `sms`
--
CREATE TRIGGER `inbox_pilgub` AFTER INSERT ON `inbox`
 FOR EACH ROW BEGIN
	INSERT INTO pilgub_inbox (id,action) VALUES (NEW.ID,'INSERT');
END
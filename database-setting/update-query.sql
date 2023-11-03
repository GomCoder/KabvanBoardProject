-- Add board_id to table card 카드 테이블에 보드 아이디 컬럼 추가
ALTER TABLE `KanbanBoard`.`card` ADD COLUMN `board_id` INT(11) NOT NULL DEFAULT 0 AFTER `id`;
ALTER TABLE `KanbanBoard`.`card` ADD INDEX `fk_board_id_idx` (`board_id` ASC);

UPDATE `KanbanBoard`.`card` c, `KanbanBoard`.`card_list` cl
SET c.board_id = cl.board_id WHERE c.card_list_id = cl.id;

ALTER TABLE `KanbanBoard`.`card` ADD CONSTRAINT `fk_card_board_board_id`
  FOREIGN KEY (`board_id`)
  REFERENCES `KanbanBoard`.`board` (`id`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

-- Change board_id to be nullable
ALTER TABLE `KanbanBoard`.`activity` CHANGE COLUMN `board_id` `board_id` INT(11) NULL  COMMENT '' AFTER `card_id`;
-- Change type to support integer value other than 0, 1
ALTER TABLE `KanbanBoard`.`activity` CHANGE COLUMN `type` `type` INT(11) NOT NULL COMMENT '' AFTER `board_id`;
-- Add `ip_address` to activity table
ALTER TABLE `KanbanBoard`.`activity` ADD COLUMN `ip_address` VARCHAR(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '' AFTER `detail`;

-- Change file_type to be a varchar
ALTER TABLE `KanbanBoard`.`attachment` CHANGE COLUMN `file_type` `file_type` VARCHAR(32) NOT NULL DEFAULT ''  COMMENT '' AFTER `file_path`;
-- Add thumbnail_created to attachment
ALTER TABLE `KanbanBoard`.`attachment` ADD COLUMN `thumbnail_created` TINYINT(1) NOT NULL DEFAULT 0 AFTER `file_type`;

-- Add `cover_image` to `card`
ALTER TABLE `KanbanBoard`.`card` ADD COLUMN `cover_image` VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL AFTER `position`;

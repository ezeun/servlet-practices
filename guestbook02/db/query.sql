CREATE TABLE IF NOT EXISTS `webdb`.`guestbook` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `contents` TEXT NOT NULL,
  `reg_date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

desc guestbook;

insert into guestbook values(null, '둘리', '1234', '하이', now());
insert into guestbook values(null, '마이콜', '123', '바이', now());

select * from guestbook;

select id, name, contents, date_format(reg_date, '%Y-%m-%d %h:%i:%s') from guestbook order by reg_date desc;
				
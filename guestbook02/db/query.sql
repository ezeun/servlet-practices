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
				
delete from guestbook where password='1234';


-- login
select * from user;
delete from user;
select id, name from user where email='12@12' and password='1234';

update user set name = "rir", password="asd", gender="male" where id=1;



DROP TABLE IF EXISTS `webdb`.`guestbook_log` ;

CREATE TABLE IF NOT EXISTS `webdb`.`guestbook_log` (
  `date` DATE NOT NULL,
  `count` INT NOT NULL,
  PRIMARY KEY (`date`))
ENGINE = InnoDB;

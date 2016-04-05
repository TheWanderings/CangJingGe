
DROP DATABASE IF EXISTS teamwork;
-- database
CREATE DATABASE IF NOT EXISTS teamwork;
USE teamwork;

-- 用户表
DROP TABLE IF EXISTS tbl_user;
CREATE TABLE tbl_user(
	uid INT PRIMARY KEY,
	account VARCHAR UNIQUE NOT NULL,
	email CHAR(50) UNIQUE NOT NULL,
	password CHAR(50) NOT NULL,
	image VARCHAR,
	create_time DATETIME
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER |   
CREATE TRIGGER trigger_user_create BEFORE INSERT ON tbl_user
	FOR EACH ROW   
		IF new.create_time IS NULL THEN   
			SET new.create_time = now();
		END IF;|   
DELIMITER ;

-- 工程表
DROP TABLE IF EXISTS tbl_project;
CREATE TABLE tbl_project(
	pid INT PRIMARY KEY,
	name VARCHAR UNIQUE NOT NULL,
	uid INT NOT NULL,  -- 文档中的owner，我认为名字和依赖表一致方便查询
	description VARCHAR NOT NULL
	image VARCHAR,
	create_time DATETIME,
	FOREIGN KEY uid REFERENCES tbl_user ON DELETE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER |   
CREATE TRIGGER trigger_pro_create BEFORE INSERT ON tbl_project
	FOR EACH ROW   
		IF new.create_time IS NULL THEN   
			SET new.create_time = now();
		END IF;|   
DELIMITER ;

-- 功能表
DROP TABLE IF EXISTS tbl_function;
CREATE TABLE tbl_function(
	fid INT PRIMARY KEY,
	pid INT NOT NULL,
	name VARCHAR NOT NULL,
	description VARCHAR NOT NULL,
	create_time DATETIME,
	FOREIGN KEY pid REFERENCES tbl_project ON DELETE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER |   
CREATE TRIGGER trigger_fun_create BEFORE INSERT ON tbl_function
	FOR EACH ROW   
		IF new.create_time IS NULL THEN   
			SET new.create_time = now();
		END IF;|   
DELIMITER ;

-- 步骤表
DROP TABLE IF EXISTS tbl_step;
CREATE TABLE tbl_step(
	sid INT PRIMARY KEY,
	fid INT NOT NULL,
	name VARCHAR NOT NULL,
	description VARCHAR NOT NULL,
	work_time LONG NOT NULL,
	status ENUM NOT NULL,
	deadline DATETIME,
	requirement VARCHAR,
	create_time DATETIME,
	FOREIGN KEY fid REFERENCES tbl_function ON DELETE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER |   
CREATE TRIGGER trigger_step_create BEFORE INSERT ON tbl_step
	FOR EACH ROW   
		IF new.create_time IS NULL THEN   
			SET new.create_time = now();
		END IF;|   
DELIMITER ;

-- 评论表
DROP TABLE IF EXISTS tbl_comment;
CREATE TABLE tbl_comment(
	cid INT PRIMARY KEY,
	type ENUM NOT NULL, -- 记录是对工程的还是功能，步骤的评论, 记为实体
	ref_id INT NOT NULL, -- 实体id
	context VARCHAR,
	create_time DATETIME,
	FOREIGN KEY fid REFERENCES tbl_function ON DELETE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER |   
CREATE TRIGGER trigger_comm_create BEFORE INSERT ON tbl_comment
	FOR EACH ROW   
		IF new.create_time IS NULL THEN   
			SET new.create_time = now();
		END IF;|   
DELIMITER ;

-- 员工表
-- 我认为员工列表要抽出来，因为这是频繁修改的，而项目表创建完就基本不修改, 
-- 原设计工程表和功能表都有staff，而功能属于工程，这就数据冗余了
-- 由于最小粒度为步骤，所以记录步骤的staff即可，也可以把它所属的工程，功能也记录下来，
-- 我不知道你的业务里是不是工程->功能->步骤 这样一条线下来的
DROP TABLE IF EXISTS tbl_work_staff;
CREATE TABLE tbl_work_staff(
	pid INT NOT NULL,
	fid INT NOT NULL,
	sid INT NOT NULL,
	staff INT NOT NULL, -- uid
	KEY(sid, staff),
	FOREIGN KEY staff REFERENCES tbl_user ON DELETE CASCADE,
	FOREIGN KEY pid REFERENCES tbl_project ON DELETE CASCADE,
	FOREIGN KEY fid REFERENCES tbl_function ON DELETE CASCADE,
	FOREIGN KEY sid REFERENCES tbl_step ON DELETE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

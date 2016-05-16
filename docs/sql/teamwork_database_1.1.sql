-- 用户表
SET FOREIGN_KEY_CHECKS=0; -- 禁用外键约束，创建完后恢复
DROP TABLE IF EXISTS tbl_user;
CREATE TABLE tbl_user(
	uid INT PRIMARY KEY,
	account VARCHAR(255) UNIQUE NOT NULL,
	email CHAR(50) UNIQUE NOT NULL,
	password CHAR(50) NOT NULL,
	image VARCHAR(255),
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 工程表
DROP TABLE IF EXISTS tbl_project;
CREATE TABLE tbl_project(
	pid INT PRIMARY KEY,
	name VARCHAR(255) UNIQUE NOT NULL,
	uid INT NOT NULL,  -- 文档中的owner，我认为名字和依赖表一致方便查询
	description VARCHAR(255) NOT NULL,
	image VARCHAR(255),
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (uid) REFERENCES tbl_user(uid) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 功能表
DROP TABLE IF EXISTS tbl_function;
CREATE TABLE tbl_function(
	fid INT PRIMARY KEY,
	pid INT NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255) NOT NULL,
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (pid) REFERENCES tbl_project(pid) ON DELETE CASCADE ON UPDATE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 步骤表
DROP TABLE IF EXISTS tbl_step;
CREATE TABLE tbl_step(
	sid INT PRIMARY KEY,
	fid INT NOT NULL,
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255) NOT NULL,
	work_time LONG NOT NULL,
	status CHAR(50) NOT NULL,
	progress INT DEFAULT 0 NOT NULL, -- 进度，完成百分比
	deadline DATETIME,
	requirement VARCHAR(255),
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (fid) REFERENCES tbl_function(fid) ON DELETE CASCADE ON UPDATE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 评论表
DROP TABLE IF EXISTS tbl_comment;
CREATE TABLE tbl_comment(
	cid INT PRIMARY KEY,
	type INT NOT NULL, -- 记录是对工程的还是功能，步骤的评论, 记为实体 1--工程，2--功能， 3--步骤
	ref_id INT NOT NULL, -- 实体id
	replay_id INT DEFAULT 0, -- 回复评论 cid， 默认0表示原始评论，其他为回复对象，
	context VARCHAR(255),
	create_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 员工表
-- 我认为员工列表要抽出来，因为这是频繁修改的，而项目表创建完就基本不修改, 
-- 原设计工程表和功能表都有staff，而功能属于工程，这就数据冗余了
-- 由于最小粒度为步骤，所以记录步骤的staff即可，也可以把它所属的工程，功能也记录下来，
-- 我不知道你的业务里是不是工程->功能->步骤 这样一条线下来的
DROP TABLE IF EXISTS tbl_work_staff;
CREATE TABLE tbl_work_staff(
	sid INT NOT NULL,
	staff INT NOT NULL, -- uid
	PRIMARY KEY(sid, staff),
	FOREIGN KEY (staff) REFERENCES tbl_user(uid) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (sid) REFERENCES tbl_step(sid) ON DELETE CASCADE ON UPDATE CASCADE	
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS=1; -- 恢复外键约束

CREATE TABLE s_config(
  id INTEGER,
  name VARCHAR(50),
  val VARCHAR(1000),
  descript varchar(200)
  CONSTRAINT [pk_s_config] PRIMARY KEY CLUSTERED
  ( [id] DESC ) ON [PRIMARY]
)


CREATE TABLE r_user_role(
  id INTEGER,	
  [user_id] INTEGER,
  [role_id] INTEGER,
  CONSTRAINT [pk_r_user_role] PRIMARY KEY CLUSTERED(
	[id] DESC 
  )ON [PRIMARY]
)

CREATE TABLE r_role_right(
  id INTEGER,
  role_id INTEGER,
  right_id INTEGER,
  right_type TINYINT DEFAULT 0, --0¿É¶Á 1¿É²Ù×÷
  CONSTRAINT [pk_r_role_right] PRIMARY KEY CLUSTERED(
	[id] DESC
  ) ON [PRIMARY]
)



USE UserManangerDemo

SELECT * FROM s_user
SELECT * FROM s_config

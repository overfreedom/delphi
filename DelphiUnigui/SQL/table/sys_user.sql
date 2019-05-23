USE UserManangerDemo

CREATE TABLE s_user
(
  id INTEGER,  --用户ID
  name VARCHAR(50) NOT NULL, --用户名
  pwd_sha256 VARCHAR(256) NOT NULL, --用户密码
  pwd_salt VARCHAR(256) NOT NULL, --密码盐
  email VARCHAR(50) UNIQUE NOT NULL, --用户邮箱
  mobile VARCHAR(15), --手机号
  sex VARCHAR(2), --性别 01男 02女 09未知
 CONSTRAINT [pk_s_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)ON [PRIMARY]
  
)






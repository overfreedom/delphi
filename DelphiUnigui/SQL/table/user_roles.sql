USE UserManangerDemo

CREATE TABLE s_role(
  id INTEGER, --用户角色ID
  name VARCHAR(50) NOT NULL UNIQUE,  --角色名称
  descript VARCHAR(200), --角色描述/备注
  CONSTRAINT [pk_s_roles] PRIMARY KEY CLUSTERED
  (
	[id] ASC
   )ON [PRIMARY]
)
USE UserManangerDemo

CREATE TABLE s_role(
  id INTEGER, --�û���ɫID
  name VARCHAR(50) NOT NULL UNIQUE,  --��ɫ����
  descript VARCHAR(200), --��ɫ����/��ע
  CONSTRAINT [pk_s_roles] PRIMARY KEY CLUSTERED
  (
	[id] ASC
   )ON [PRIMARY]
)
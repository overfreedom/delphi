USE UserManangerDemo

CREATE TABLE s_user
(
  id INTEGER,  --�û�ID
  name VARCHAR(50) NOT NULL, --�û���
  pwd_sha256 VARCHAR(256) NOT NULL, --�û�����
  pwd_salt VARCHAR(256) NOT NULL, --������
  email VARCHAR(50) UNIQUE NOT NULL, --�û�����
  mobile VARCHAR(15), --�ֻ���
  sex VARCHAR(2), --�Ա� 01�� 02Ů 09δ֪
 CONSTRAINT [pk_s_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)ON [PRIMARY]
  
)






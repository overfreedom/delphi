USE UserManangerDemo

CREATE TABLE s_right
    (id INTEGER, --Ȩ��ID	
     name VARCHAR(100) NOT NULL
                       UNIQUE, --Ȩ����
     descript VARCHAR(200), --Ȩ����������ע
     CONSTRAINT [pk_s_right] PRIMARY KEY CLUSTERED ([id] DESC) ON [PRIMARY])
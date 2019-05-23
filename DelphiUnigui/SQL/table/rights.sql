USE UserManangerDemo

CREATE TABLE s_right
    (id INTEGER, --权限ID	
     name VARCHAR(100) NOT NULL
                       UNIQUE, --权限名
     descript VARCHAR(200), --权限描述，备注
     CONSTRAINT [pk_s_right] PRIMARY KEY CLUSTERED ([id] DESC) ON [PRIMARY])
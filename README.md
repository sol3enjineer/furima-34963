##usersテーブル
|Column            |Type    |Options        |
|------------------|--------|---------------|
|nickname          |string  |NOT NULL       |
|email             |string  |NOT UNIQUE     |
|password          |string  |NOT NULL       |


##itemsテーブル
|Column                    |Type        |Options        |
|--------------------------|------------|---------------|
|image                     |            |               |
|Product name              |text        |NOT NULL       |
|user                      |references  |               |
|Product description       |text        |NOT NULL       |
|category                  |text        |NOT NULL       |
|Product condition         |text        |NOT NULL       |
|Shipping charges          |text        |NOT NULL       |
|Shipping area             |text        |NOT NULL       |
|Shipping date             |text        |NOT NULL       |
|price                     |text        |NOT NULL       |


##orderテーブル
|Column            |Type      |Options           |
|------------------|----------|------------------|
|user              |references|                  |
|items             |references|                  |
|


##addressテーブル
|Column            |Type      |Options           |
|------------------|----------|------------------|
|order             |references|                  |

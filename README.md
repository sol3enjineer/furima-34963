##usersテーブル
|Column            |Type    |Options        |
|------------------|--------|---------------|
|nickname          |string  |NOT NULL       |
|email             |string  |NOT UNIQUE     |
|password          |string  |NOT NULL       |
|Firstname         |string  |NOT NULL       |
|Lastname          |string  |NOT NULL       |
|Firstname_kana    |string  |NOT NULL       |
|Lastname_kana     |string  |NOT NULL       |
|Birthday          |string  |NOT NULL       |


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
|seller                    |text        |NOT NULL       |


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
|Card information  |text      |NOT NULL          |
|date of expiry_y  |text      |NOT NULL          |
|date of expiry_m  |text      |NOT NULL          |
|Security code     |text      |NOT NULL          |
|Postal code       |text      |NOT NULL          |
|Prefectures       |text      |NOT NULL          |
|municipalities    |text      |NOT NULL          |
|address           |text      |NOT NULL          |
|Building name     |text      |                  |
|telephone number  |text      |NOT NULL          |
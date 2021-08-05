##usersテーブル
|Column            |Type    |Options        |
|------------------|--------|---------------|
|nickname          |string  |NOT NULL       |
|email             |string  |NOT UNIQUE     |
|encrypted_password|string  |NOT NULL       |
|firstname         |string  |NOT NULL       |
|lastname          |string  |NOT NULL       |
|firstname_kana    |string  |NOT NULL       |
|lastname_kana     |string  |NOT NULL       |
|birthday          |date    |NOT NULL       |

### Association
- has_many :items
- has_many :orders


##itemsテーブル
|Column                    |Type        |Options          |
|--------------------------|------------|-----------------|
|name                      |string      |NOT NULL         |
|user                      |references  |foreign_key: true|
|product_description       |text        |NOT NULL         |
|category_id               |integer     |NOT NULL         |
|product_condition_id      |integer     |NOT NULL         |
|shipping_charge_id        |integer     |NOT NULL         |
|prefectures               |integer     |NOT NULL         |
|shipping_date_id          |integer     |NOT NULL         |
|price                     |integer     |NOT NULL         |


### Association
- has_one :order
- belongs_to :users

##ordersテーブル
|Column            |Type      |Options           |
|------------------|----------|------------------|
|user              |references|foreign_key: true |
|item              |references|foreign_key: true |
|
### Association
- has_one :address
- belongs_to :users

##addressテーブル
|Column            |Type      |Options           |
|------------------|----------|------------------|
|order             |references|foreign_key: true |
|postal_code       |text      |NOT NULL          |
|prefectures       |integer   |NOT NULL          |
|municipalities    |string    |NOT NULL          |
|address           |string    |NOT NULL          |
|building_name     |string    |                  |
|telephone_number  |string    |NOT NULL          |


##usersテーブル
|Column            |Type    |Options            |
|------------------|--------|-------------------|
|nickname          |string  |NOT NULL           |
|email             |string  |NOT NULL/NOT UNIQUE|
|encrypted_password|string  |NOT NULL           |
|firstname         |string  |NOT NULL           |
|lastname          |string  |NOT NULL           |
|firstname_kana    |string  |NOT NULL           |
|lastname_kana     |string  |NOT NULL           |
|birthday          |date    |NOT NULL           |

### Association
- has_many :items
- has_many :orders


##itemsテーブル
|Column                    |Type        |Options          |
|--------------------------|------------|-----------------|
|name                      |string      |NOT NULL         |
|user                      |references  |FOREIGN KEY      |
|product_description       |text        |NOT NULL         |
|category_id               |integer     |NOT NULL         |
|product_condition_id      |integer     |NOT NULL         |
|shipping_charge_id        |integer     |NOT NULL         |
|prefecture_id             |integer     |NOT NULL         |
|shipping_date_id          |integer     |NOT NULL         |
|price                     |integer     |NOT NULL         |


### Association
- has_one :order
- belongs_to :user

##ordersテーブル
|Column            |Type      |Options           |
|------------------|----------|------------------|
|user              |references|foreign_key: true |
|item              |references|foreign_key: true |
|
### Association
- has_one :address
- belongs_to :user
- belongs_to :items

##addressテーブル
|Column            |Type      |Options           |
|------------------|----------|------------------|
|order             |references|foreign_key: true |
|postal_code       |string    |NOT NULL          |
|prefecture_id     |integer   |NOT NULL          |
|municipalities    |string    |NOT NULL          |
|address           |string    |NOT NULL          |
|building_name     |string    |                  |
|telephone_number  |string    |NOT NULL          |

### Association
- belongs_to :orders

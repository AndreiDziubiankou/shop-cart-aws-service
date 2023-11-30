create extension if not exists "uuid-ossp";
CREATE TYPE cart_status AS ENUM ('OPEN', 'ORDERED');

create table if not exists carts (
    id uuid NOT NULL PRIMARY KEY default uuid_generate_v4(),
    user_id uuid NOT NULL default uuid_generate_v4(),
    created_at date NOT NULL default current_date,
    updated_at date NOT NULL default current_date,
    status cart_status NOT NULL default 'OPEN'
);

create table if not exists cart_items (
   cart_id uuid NOT NULL REFERENCES carts(id),
   product_id uuid NOT NULL,
   count integer NOT NULL,
   foreign key ("cart_id") references "carts" ("id")
   on update cascade
   on delete cascade
);

INSERT INTO carts (id, user_id) VALUES ('8ead7c87-bcc7-4514-a6cd-ab844e910f31', '784f7153-d829-4e54-bd90-6dd533ff2d24');
INSERT INTO carts (id, user_id) VALUES ('08a632b4-806a-4e63-a074-3d60bb997517', 'ba5d17f2-1c28-4beb-a5e4-501bb6534c54');


INSERT INTO cart_items (cart_id, product_id, count) VALUES ('8ead7c87-bcc7-4514-a6cd-ab844e910f31', 'aed4363b-def9-4b83-9af0-67301a372251', 2);
INSERT INTO cart_items (cart_id, product_id, count) VALUES ('8ead7c87-bcc7-4514-a6cd-ab844e910f31', '31b8a782-4267-4bdd-965a-63d15a723ed4', 1);

INSERT INTO cart_items (cart_id, product_id, count) VALUES ('08a632b4-806a-4e63-a074-3d60bb997517', '31b8a782-4267-4bdd-965a-63d15a723ed4', 5);
INSERT INTO cart_items (cart_id, product_id, count) VALUES ('08a632b4-806a-4e63-a074-3d60bb997517', 'aed4363b-def9-4b83-9af0-67301a372251', 6);


select * from carts;
select * from cart_items;


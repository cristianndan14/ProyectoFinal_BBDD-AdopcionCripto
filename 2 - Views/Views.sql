USE cripto ;


-- Vista de paises donde las criptomonedas son legales
CREATE OR REPLACE VIEW cripto.vw_criptoLegal_paises AS
( SELECT nombre , 'Legalizado' from paises where cripto_legal is true ) ;

SELECT * from cripto.vw_criptoLegal_paises ;


-- Vista cant de usuarios por pais que usan criptomonedas
CREATE OR REPLACE VIEW cripto.vw_paises_usuarios AS
(select p.nombre , count(u.id_pais) as cant_usuarios
from usuarios as u
join paises as p
on u.id_pais = p.id_pais
group by u.id_pais
order by cant_usuarios desc
)
;

select * from cripto.vw_paises_usuarios ;


-- Vista cant de usuarios por wallets de criptomonedas
CREATE OR REPLACE VIEW cripto.vw_wallet_usuarios AS
(select w.nombre , count(u.id_wallet) as cant_usuarios
from usuarios as u
join wallet as w
on u.id_wallet = w.id_wallet
group by u.id_wallet
order by cant_usuarios desc
)
;

SELECT * FROM cripto.vw_wallet_usuarios ;


-- Vista criptomoneda mas usada por los comercios/servicios
CREATE OR REPLACE VIEW cripto.vw_criptomonedas_comercio_servicios AS
(select c.nombre , count(c_s.id_criptomoneda) as cant_comercio_servicios
from criptomoneda as c
join comercio_servicio as c_s
on c_s.id_criptomoneda = c.id_criptomoneda
group by c.id_criptomoneda
order by cant_comercio_servicios desc
)
;

SELECT * FROM cripto.vw_criptomonedas_comercio_servicios ;


-- Vista de paises donde las criptomonedas no son legales
CREATE OR REPLACE VIEW cripto.vw_criptoNoLegal_paises AS
( SELECT nombre , 'No Legalizado' from paises where cripto_legal is false ) ;

SELECT * from cripto.vw_criptoNoLegal_paises ;



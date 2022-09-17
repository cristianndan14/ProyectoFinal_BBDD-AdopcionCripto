# Seguir orden de ejecucion de scripts para recrear BBDD

- 0 Creacion de esquema y tablas
- 1 Data insertion. Importar .csv a cada tabla correspondiente siguiente este orden:

```bash
	- paises.csv
	- criptomonedas.csv
	- wallet.csv
	- usuarios.csv
	- comercio_servicio.csv
```

- 2 Views
- 3 Functions
- 4 Stored procedures
- 5 Trigger + tablas log
- 6 Script DCL
- 7 Script TCL
- 8 Data import

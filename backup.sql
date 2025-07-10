---fazendo o backup do banco()
--- C:\Users\integral\Desktop\ArnaldoSQL\backups
---botao windos + v abre uma janela de todos os ctrl+v.

--comamdos para o backup
BACKUP DATABASE bd_16_byciclon
TO DISK ='C:\Users\integral\Desktop\ArnaldoSQL\backups\bd_16_byciclon_10_07_25.BAK'
WITH FORMAT,
     MEDIANANE = 'bd_16_byciclon_backup',
	 NAME = 'Full Backup do BD Byciclon'

	 ---restaurar backup feito anteriormente
RESTORE DATABASE bd_16_Byciclon
FROM DISK = 'C:\Users\integral\Desktop\ArnaldoSQL\backups\bd_16_byciclon_10_07_25.BAK'
WITH REPLACE 


     

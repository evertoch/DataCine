@ECHO off
TITLE DataCine
cls
color 0b


:MenuInicial
cls
ECHO.
ECHO    ---------------------------------------
ECHO    -- * MENU BACKUP/RESTORE DATACINE  * -- 
ECHO    -- *   ESCOLHA UMA OPCAO ABAIXO    * --
ECHO    ---------------------------------------
ECHO.  
ECHO    [1] BACKUP 
ECHO    [2] RESTORE
ECHO    [X] Sair
ECHO.
set /p MenuInicial=
if '%MenuInicial%'=='1' goto MenuInicial_backup
if '%MenuInicial%'=='2' goto MenuInicial_restore
if '%MenuInicial%'=='x' goto sair_MenuInicial
if '%MenuInicial%'=='X' goto sair_MenuInicial
if not %MenuInicial%=="1,2,3,X" (
ECHO    Opcao [%MenuInicial%] invalida.
ECHO    Verifique o menu acima.

goto MenuInicial
)

:MenuInicial_backup
MKDIR %USERPROFILE%\Desktop\Backup_DataCine
cd %USERPROFILE%\Desktop\Backup_DataCine
ECHO %date:~6,4%.%date:~3,2%.%date:~0,2% - %time:~0,2%:%time:~-8,2%: BACKUP iniciado >> sgbd.log
ECHO Em execucao...
"c:\Program Files\PostgreSQL\14\bin\pg_dump.exe" -Fc -U postgres -d datacine -C -Fp -f  backup.bak >> sgbd.log
ren "%USERPROFILE%\Desktop\Backup_DataCine\backup.bak" "Backup_datacine_%date:~6,4%.%date:~3,2%.%date:~0,2%_%time:~0,2%%time:~-8,2%.bak" >> sgbd.log

ECHO %date:~6,4%.%date:~3,2%.%date:~0,2% - %time:~0,2%:%time:~-8,2%: BACKUP concluido >> sgbd.log
goto MenuInicial

:MenuInicial_restore
cls
ECHO O nome da base restaurada deve ser "Backup.bak". >> sgbd.log
:Menu_restore
ECHO.
color 4
ECHO    --------------------------------------------------------
ECHO    -- *              LEIA COM ATENCAO!                 * --
timeout 4 > NUL
color 0B
ECHO    -- *      O NOME DO ARQUIVO DEVE SER backup.bak     * -- 
ECHO    -- *   O ARQUIVO DEVE ESTAR EM C:\Backup_DataCine   * --
ECHO    --------------------------------------------------------
ECHO.  
ECHO    [1] PROSSEGUIR 
ECHO    [X] SAIR
ECHO.
set /p Menu_restore=
if '%Menu_restore%'=='1' goto Restore_prosseguir
if '%Menu_restore%'=='x' goto MenuInicial
if '%Menu_restore%'=='X' goto MenuInicial
:Restore_prosseguir
cd C:\Backup_DataCine
ECHO.
ECHO Em execucao o processo de restauracao...
ECHO.
ECHO %date:~6,4%.%date:~3,2%.%date:~0,2% - %time:~0,2%:%time:~-8,2%: RESTORE iniciado >> sgbd.log
ECHO Informe a senha para apagar a base de dados existente:
"c:\Program Files\PostgreSQL\14\bin\dropdb.exe" -U postgres datacine
ECHO.
ECHO Informe a senha para restaurar o backup...
"c:\Program Files\PostgreSQL\14\bin\psql.exe" -U postgres -d postgres < "backup.bak" >> sgbd.log
ECHO %date:~6,4%.%date:~3,2%.%date:~0,2% - %time:~0,2%:%time:~-8,2%: RESTORE concluido >> sgbd.log
ECHO %date:~6,4%.%date:~3,2%.%date:~0,2% - %time:~0,2%:%time:~-8,2%: Base restaurada >> sgbd.log

goto MenuInicial

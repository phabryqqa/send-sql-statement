/*  Descrição:  Utilização da Função send-sql-statement Banco Oracle Progress   */
/*  Objetivo:   Mostrar o Tipo/Type do Banco conectado                          */
/*  Autor:      Cristiano Rodrigues do Amaral                                   */

DEFINE VARIABLE handle1 AS INTEGER NO-UNDO.
DEFINE VARIABLE iMax    AS INTEGER NO-UNDO.

    IF DBTYPE('shmgcad')='ORACLE' THEN DO:

        RUN STORED-PROC send-sql-statement handle1 = PROC-HANDLE
            ('Selec MAX(nr-ped-cli) from ped-venda').

            FOR EACH proc-text-buffer:
                assign  iMax    =   INTEGER(SUBSTR(proc-text,1,3)).
                DISPLAY iMax.
            END.

        CLOSE STORED-PROC send-sql-statement WHERE PROC-HANDLE = handle1.

    END.
    ELSE IF DBTYPE('mgcad') = 'PROGRESS' THEN DO:
        FIND LAST ped-venda.
        DISP ped-venda.nr-ped-cli.
    END.


cd $PSScriptRoot
$servidor        = "servername\instancename"
$archivo         = ".\spwhofinal.sql"
$output          = ".\conectionlog.csv"
$outputerror     = ".\errors.txt"

<# Query to invoke from the file

$query = "
begin

DECLARE @Tempspwho TABLE(
        SPID INT,
        Status VARCHAR(MAX),
        LOGIN VARCHAR(MAX),
        HostName VARCHAR(MAX),
        BlkBy VARCHAR(MAX),
        DBName VARCHAR(MAX),
        Command VARCHAR(MAX),
        CPUTime INT,
        DiskIO INT,
        LastBatch VARCHAR(MAX),
        ProgramName VARCHAR(MAX),
        SPID_1 INT,
        REQUESTID INT
)

INSERT INTO @Tempspwho EXEC sp_who2

SELECT  login,HostName,LastBatch,cputime,diskio
FROM    @Tempspwho

end"
#>

Invoke-Sqlcmd -ServerInstance $servidor -InputFile $archivo -ErrorAction Stop


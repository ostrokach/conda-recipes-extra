# MariaDB Server

## Instructions

1. Create a database:

```bash
mysql_install_db --no-defaults --basedir=$HOME/anaconda --datadir=$HOME/mysql_db/
```

2. Start daemon process:

```bash
mysqld --no-defaults --basedir=$HOME/anaconda --datadir=$HOME/mysql_db/
```

`--basedir` is the location where MariaDB is installed, and should correspond to your anaconda environment.
`--datadir` is the location where MariaDB will store database files.
`--language` is the location of langauge files ($HOME/anaconda/share/ assuming the paths above).


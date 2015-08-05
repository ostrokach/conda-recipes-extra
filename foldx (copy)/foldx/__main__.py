import os
import os.path as op
import sys
import shutil
import subprocess
from . import config

def main():
    """Creates a symlink to `rotabase.txt` and runs `foldx`.
    """
    if len(sys.argv) == 1:
        subprocess.Popen(['_foldx'])
        return
    
    cwd = os.getcwd()
    if not op.isfile(op.join(cwd, 'rotabase.txt')):
        shutil.copy(op.join(config.data_path, 'rotabase.txt'), op.join(cwd, 'rotabase.txt'))
    subprocess.Popen(['_foldx'] + sys.argv[1:])

if __name__ == '__main__':
    sys.exit(main())

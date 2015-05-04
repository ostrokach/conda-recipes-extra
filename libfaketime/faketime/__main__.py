import os
import sys
import subprocess
from . import config


def main():
    """Run process in a different system time.

    The first argument should be the fake date, 
    in '2008-12-24 08:15:42' format.

    Specify the '--use-mt' flag to use multithreading libraries.
    """
    # Check for the '--use-mt' flag
    use_mt = False
    if sys.argv.count('--use-mt'):
        use_mt = True
        del sys.argv[sys.argv.index('--use-mt')]

    # Make sure we have enough arguments and get the fake time
    if len(sys.argv) < 3:
        error_message = (
            "In the least, you need to specify the fake time (argv[1])"
            "and the command to run (argv[2])"
        )
        raise Exception(error_message)
    fake_time = sys.argv[1]

    # Get the `libfaketime.so` path and filename
    if use_mt:
        libfaketime_so_file = config.libfaketime_so_file_mt
    else:
        libfaketime_so_file = config.libfaketime_so_file

    # Run the command using fake time
    env = os.environ.copy()
    env['LD_PRELOAD'] = libfaketime_so_file
    env['FAKETIME'] = fake_time
    child_process = subprocess.Popen(sys.argv[2:], env=env)
    result, error_message = child_process.communicate()


if __name__ == '__main__':
    sys.exit(main())

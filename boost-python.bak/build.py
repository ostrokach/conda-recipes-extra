import os
import subprocess

prefix = os.environ['PREFIX']
path_to_lib = os.path.join(prefix, 'lib/')

for filename in os.listdir(path_to_lib):
    if filename.startswith('libboost_') and filename.endswith('.so.1.55.0'):
        subprocess.check_call('ln -s {} {}'.format(
            path_to_lib + filename, 
            path_to_lib + filename.replace('.so.1.55.0', '-gcc46-mt-1_55.so.1.55.0')), shell=True)

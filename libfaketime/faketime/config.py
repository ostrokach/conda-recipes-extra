import os.path as op

libfaketime_install_path = op.normpath(op.join(op.dirname(__file__), '..', '..', '..', 'faketime'))
libfaketime_so_file = op.join(libfaketime_install_path, 'libfaketime.so.1')
libfaketime_so_file_mt = op.join(libfaketime_install_path , 'libfaketimeMT.so.1')

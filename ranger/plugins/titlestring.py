import ranger.api
import os
import sys

old_hook_init = ranger.api.hook_init

def format_path(pathstr):
    # if len(pathstr) > 32:
    #     ret = ''
    #     for component in pathstr.split
    return pathstr
    

def hook_init(fm):
    def on_cd():
        if fm.thisdir:
            title = f'(ranger) {format_path(fm.thisdir.path)}'
            sys.stdout.write("\033]0;"+title+"\a")
            sys.stdout.flush()

    fm.signal_bind('cd', on_cd)
    return old_hook_init(fm)

ranger.api.hook_init = hook_init

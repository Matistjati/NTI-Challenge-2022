#!/usr/bin/python3


import sys
import random
import math


def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
r = int(cmdlinearg('r'))
c = int(cmdlinearg('c'))
min_power = int(cmdlinearg('min_power'))
max_power = int(cmdlinearg('max_power'))
plane_distribution = float(cmdlinearg('plane_distribution'))
shuffle_nodes = cmdlinearg('shuffle_nodes',default="true")=="true"
mode = cmdlinearg('mode')

"Info"

import os, sys, sysconfig, platform
import typing as T
from pprint import pprint

import attrs


@attrs.define
class D:
    pyver: str
    pyvertuple: T.Any | T.Tuple


class DTuple(T.NamedTuple):
    pyver: str
    pyvertuple: T.Any | T.Tuple
    pyplatform: str | bytes


dtup = DTuple(sys.version, sys.version_info, platform.platform())


d = D(sys.version, sys.version_info)
print(type(sys.version_info))
print(dtup)


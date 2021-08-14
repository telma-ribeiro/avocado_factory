#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import numpy as np
from random import randint

for i in range(10):
	val1 = randint(0, 255)
	val2 = randint(0, 255)
	print('[[' , val1 , ',' , val2 , ',0],[0,255,255],[255,255,255],[0,0,0]]')
	time.sleep(1)
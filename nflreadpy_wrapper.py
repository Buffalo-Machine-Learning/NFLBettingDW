import polars as pl
import nflreadpy as nfl
import pandas as pd

class NFLReadPyWrapper:
    def __init__(self):
        self.pbp_data = None
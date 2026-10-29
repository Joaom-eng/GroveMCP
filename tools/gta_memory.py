"""Project entry point for the versioned gta-sa-memory skill's offline lookup."""
from pathlib import Path
import runpy

if __name__ == '__main__':
    runpy.run_path(str(Path(__file__).resolve().parents[1] /
                      'skills/gta-sa-memory/scripts/lookup.py'), run_name='__main__')

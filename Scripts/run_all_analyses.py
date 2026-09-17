# -*- coding: utf-8 -*-
"""
Master Analysis Pipeline
Study: Authenticity Gap in AI-Assisted Academic Writing
Author: Dr. Pegah Merrikhi (pegah.merrikhiii@gmail.com)
"""

import subprocess
import sys
import time

def run_step(script_name):
    print(f"\n{'#'*65}")
    print(f"RUNNING STEP: {script_name}")
    print(f"{'#'*65}\n")
    start = time.time()
    result = subprocess.run([sys.executable, script_name])
    duration = time.time() - start
    if result.returncode == 0:
        print(f"\n>>> [SUCCESS] {script_name} finished in {duration:.2f}s")
    else:
        print(f"\n>>> [WARNING/ERROR] {script_name} exited with code {result.returncode}")

def main():
    pipeline = [
        '01_eda_and_reliability.py',
        '02_linguistic_analysis_ttests.py',
        '03_lmem_analysis.py',
    ]
    print("STARTING COMPLETE PYTHON ANALYSIS WORKFLOW...")
    for script in pipeline:
        run_step(script)
    print("\nALL PIPELINE STAGES COMPLETED.")

if __name__ == '__main__':
    main()

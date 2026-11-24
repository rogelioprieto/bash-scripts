#!/bin/bash
#2026-11-24
# Search for missing .desktop files and remove them in the MATE Panel 
# Note: AI used. This is the final result of a Gemini prompt.
# Rogelio Prieto Alvarado

# 1. back up current panel layout 
dconf dump /org/mate/panel/ > ~/mate-panel-backup-$(date +%Y-%m-%d_%H-%M-%S).dconf

# 2.  run a Python script: this one-liner to inspect which object IDs point to missing .desktop files and remove them from object-id-list

python3 -c '
import subprocess, os, ast

ids = ast.literal_eval(subprocess.check_output(["gsettings", "get", "org.mate.panel", "object-id-list"]).decode())
keep = []
for obj_id in ids:
    schema = f"org.mate.panel.object:/org/mate/panel/objects/{obj_id}/"
    if subprocess.check_output(["gsettings", "get", schema, "object-type"]).decode().strip() == "\x27launcher\x27":
        loc = subprocess.check_output(["gsettings", "get", schema, "launcher-location"]).decode().strip().strip("\x27")
        if loc.startswith("/") and not os.path.exists(loc):
            print("Removing orphaned launcher:", obj_id, "->", loc)
            subprocess.run(["dconf", "reset", "-f", f"/org/mate/panel/objects/{obj_id}/"])
            continue
    keep.append(obj_id)

subprocess.run(["gsettings", "set", "org.mate.panel", "object-id-list", str(keep)])
'

# 3. Reload the panel to verify the warnings are gone:
mate-panel --replace &




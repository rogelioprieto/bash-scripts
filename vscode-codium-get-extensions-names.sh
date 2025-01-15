#!/bin/bash
#Rogelio Prieto
#enero/2025
#source:
#https://stackoverflow.com/a/51403163/7674231

codium --list-extensions | xargs -L 1 echo codium --install-extension

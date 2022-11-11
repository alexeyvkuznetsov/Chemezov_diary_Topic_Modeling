@echo off
setlocal EnableDelayedExpansion
if exist result.csv del result.csv
for %%f in (*.txt) do (
    set i=0
    for /F "delims=" %%l in (%%f) do (
        set /A i+=1
        set line!i!=%%l
    )
    echo %%f, !line1!, !line2!, >> result.csv
)

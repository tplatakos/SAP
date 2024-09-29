@echo off
setlocal enabledelayedexpansion

set pdfPath=\\sapqdv\Devtst\IQ4528\impact_arch
set movePath=\\sapqdv\Devtst\IQ4528\impact_arch\Impact
set movePattern=*_out.pdf
set delPattern=*_in.pdf

set LogFile=\\sapqdv\Devtst\IQ4528\impact_arch\impactarch.log


echo ---------------------------------------------------------------- 
echo ---------------------------------------------------------------- >> !LogFile!
echo Move pdf files %date:~4,10% %time:~0,8%
echo Move pdf files %date:~4,10% %time:~0,8% >> !LogFile!
echo ----------------------------------------------------------------  
echo ----------------------------------------------------------------  >> !LogFile!

for %%F in (%pdfPath%\%movePattern%) do (
 echo move : %%F !movePath!
 echo Move : %%F !movePath! >> !LogFile!
 move %%F %movePath% 
  if %ERRORLEVEL%==0 (
        echo %%~nxF moved successfully >> !LogFile!.
    ) else (
        echo Error moving %%~nxF >> !LogFile!
    )
)


echo ---------------------------------------------------------------- 
echo ---------------------------------------------------------------- >> !LogFile!
echo Delete pdf files %date:~4,10% %time:~0,8%
echo Delete pdf files %date:~4,10% %time:~0,8% >> !LogFile!
echo ----------------------------------------------------------------  
echo ----------------------------------------------------------------  >> !LogFile!

for %%F in (%pdfPath%\%delPattern%) do (
 echo Delete : %%F 
 echo Delete : %%F >> !LogFile!
 del %%F
  if %ERRORLEVEL%==0 (
        echo %%~nxF deleted successfully >> !LogFile!.
    ) else (
        echo Error in delete file %%~nxF >> !LogFile!
    )
	
)
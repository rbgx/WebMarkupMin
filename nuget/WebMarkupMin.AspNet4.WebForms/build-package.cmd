set project_name=WebMarkupMin.AspNet4.WebForms
set project_source_dir=..\..\src\%project_name%
set project_bin_dir=%project_source_dir%\bin\Release
set nuget_package_manager=..\..\.nuget\nuget.exe

call ../setup.cmd

rmdir lib /Q/S

%dotnet_cli% restore "%project_source_dir%"
%dotnet_cli% build "%project_source_dir%" --framework net40 --configuration Release --no-dependencies --no-incremental
xcopy "%project_bin_dir%\net40\%project_name%.dll" lib\net40\ /E
xcopy "%project_bin_dir%\net40\%project_name%.xml" lib\net40\ /E

%nuget_package_manager% pack "..\%project_name%\%project_name%.nuspec"
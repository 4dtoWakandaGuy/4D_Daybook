//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_iNIFilePathSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 11:46`Method: PDF995_iNIFilePathSet
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_IniFilePathCopyStr; <>PDF995_IniFilePathStr; <>PDF995_IniFilePathTempStr; $_t_DefaultINIPath; $_t_IniFileName; $_t_oldMethodName; $_t_StructureFileName; $1)
	C_TIME:C306($_ti_DocReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_iNIFilePathSet")

If (Is Windows:C1573)
	
	PDF995_constantsInit
	
	$_t_DefaultINIPath:=PDF995_iNIFilePathGetDefault  //"C:\\Program Files\\pdf995\\res\\pdf995.ini"
	
	Case of 
		: (Count parameters:C259=0)
			PDF995_errorSet("PDF995 INI file path is invalid!")
			
		: (Test path name:C476($1)=Is a document:K24:1)  //path provided is ok
			<>PDF995_IniFilePathStr:=$1
			
		: (Test path name:C476($_t_DefaultINIPath)=Is a document:K24:1)  //default installer installs ini file at this path
			<>PDF995_IniFilePathStr:=$_t_DefaultINIPath
			
		: (Test path name:C476($1)#Is a document:K24:1)
			PDF995_errorSet("PDF995 INI file path is invalid!")
			
			If (Not:C34(Is compiled mode:C492))
				
				CONFIRM:C162("PDF995: Ini file path is invalid, Set Ini file path by selecting the ini file!")
				If (OK=1)
					$_ti_DocReference:=DB_OpenDocument("")
					If (OK=1)
						CLOSE DOCUMENT:C267($_ti_DocReference)
						<>PDF995_IniFilePathStr:=DOCUMENT
					End if 
				End if 
			End if 
		Else 
			<>PDF995_IniFilePathStr:=$1
	End case 
	
	//Mon, Jan 30, 2006 bwalia: make sure we don't override ini file for other applications like MS Word etc
	$_t_IniFileName:=PDF995_filePathToName(<>PDF995_IniFilePathStr)
	$_t_StructureFileName:=PDF995_filePathToName(Structure file:C489)
	
	$_t_StructureFileName:=Replace string:C233($_t_StructureFileName; ".4DB"; "")
	$_t_StructureFileName:=Replace string:C233($_t_StructureFileName; ".4DC"; "")
	
	<>PDF995_IniFilePathCopyStr:=<>PDF995_IniFilePathStr
	
	<>PDF995_IniFilePathCopyStr:=Replace string:C233(<>PDF995_IniFilePathCopyStr; $_t_IniFileName; $_t_StructureFileName+"_"+$_t_IniFileName)
	<>PDF995_IniFilePathTempStr:=""
	
	If (Test path name:C476(<>PDF995_IniFilePathStr)=Is a document:K24:1)
		
		//COPY DOCUMENT(◊PDF995_IniFilePathStr;◊PDF995_IniFilePathCopyStr;*)
		PDF995_DoDocument("COPY DOCUMENT"; <>PDF995_IniFilePathStr; <>PDF995_IniFilePathCopyStr; "*")  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
		
		<>PDF995_IniFilePathTempStr:=Replace string:C233(<>PDF995_IniFilePathStr; $_t_IniFileName; "Temp_"+$_t_IniFileName)
		
		//COPY DOCUMENT(◊PDF995_IniFilePathStr;◊PDF995_IniFilePathTempStr;*)
		PDF995_DoDocument("COPY DOCUMENT"; <>PDF995_IniFilePathStr; <>PDF995_IniFilePathTempStr; "*")  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
		
	End if 
	
End if 

ERR_MethodTrackerReturn("PDF995_iNIFilePathSet"; $_t_oldMethodName)

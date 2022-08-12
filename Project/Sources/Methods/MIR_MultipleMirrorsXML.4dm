//%attributes = {}
If (False:C215)
	//Project Method Name:      MIR_MultipleMirrorsXML
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($LNumberParameters)
	C_POINTER:C301($3; $pLogNames)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $sXML_ElementReference; $sXML_Reference; $tAction; $tExistingLogs; $tFilePath; $tLogFileNames; $tServerIP; $tSettingsFolderPath)
	C_TEXT:C284($tXML_ElementValue)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MIR_MultipleMirrorsXML")


// Declare parameters

// Declare local variables

// Reassign for readability
$tAction:=$1

$LNumberParameters:=Count parameters:C259
$tServerIP:=Replace string:C233($2; "."; "_")
If ($LNumberParameters>2)
	$pLogNames:=$3
	$tLogFileNames:=$pLogNames->
End if 

// Declare default values
$tFilePath:=MIR_MirrorPath("Multiples"+$tServerIP+".xml")

Case of 
	: ($tAction="Load")
		$tSettingsFolderPath:=MIR_GetFolderpathName($tFilePath)
		If (Test path name:C476($tSettingsFolderPath)#0)  // See if the directory exists
			MIR_SetFolderPath($tSettingsFolderPath)
		End if 
		
		If (Test path name:C476($tFilePath)#1)  // Check to see if a valid file exists
			MIR_MultipleMirrorsXML("Create"; $tServerIP)  // If not create a preferences file
			$tLogFileNames:=""
		Else 
			$sXML_Reference:=DOM Parse XML source:C719($tFilePath)
			$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/Multiples/LogsToTransfer")
			DOM GET XML ELEMENT VALUE:C731($sXML_ElementReference; $tLogFileNames)
			DOM CLOSE XML:C722($sXML_Reference)
		End if 
		
		$pLogNames->:=$tLogFileNames
		
		
	: ($tAction="Save")
		$sXML_Reference:=DOM Parse XML source:C719($tFilePath)
		$sXML_ElementReference:=DOM Find XML element:C864($sXML_Reference; "/Multiples/LogsToTransfer")
		DOM SET XML ELEMENT VALUE:C868($sXML_ElementReference; $tLogFileNames)
		DOM EXPORT TO FILE:C862($sXML_Reference; $tFilePath)
		DOM CLOSE XML:C722($sXML_Reference)
		
	: ($tAction="AddLog")
		$tExistingLogs:=""
		MIR_MultipleMirrorsXML("Load"; $tServerIP; ->$tExistingLogs)
		If (Length:C16($tExistingLogs)>0)
			$tLogFileNames:=$tExistingLogs+","+$tLogFileNames
		End if 
		MIR_MultipleMirrorsXML("Save"; $tServerIP; ->$tLogFileNames)
		
	: ($tAction="Create")
		$tLogFileNames:=""
		$sXML_Reference:=DOM Create XML Ref:C861("Multiples")
		$tXML_ElementValue:="/Multiples/LogsToTransfer"
		$sXML_ElementReference:=DOM Create XML element:C865($sXML_Reference; $tXML_ElementValue)
		DOM SET XML ELEMENT VALUE:C868($sXML_ElementReference; $tLogFileNames)
		DOM EXPORT TO FILE:C862($sXML_Reference; $tFilePath)
		DOM CLOSE XML:C722($sXML_Reference)
End case 
ERR_MethodTrackerReturn("MIR_MultipleMirrorsXML"; $_t_oldMethodName)
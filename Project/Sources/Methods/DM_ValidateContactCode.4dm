//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ValidateContactCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2010 17:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_AddedItemID; $_l_GetCodeProcess; $_l_ListID; $_l_ProcessState; $_l_SourcePosition; $1; $2)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName; $0; $3; DM_t_CompanyCode; DM_t_DBContactCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateContactCode")
//the method will validate from the source the contact code passed in $3 if a $4 i
//is given(pointer to a variable(string) the company code
//will be placed in that variable
//load the list data sources here(hidden list)
//$1=source type
//$2=The Preference ID
//$3=The data
ARRAY LONGINT:C221(DM_al_DataSources; 0)
ARRAY TEXT:C222(DM_at_DataSources; 0)
$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
$_l_SourcePosition:=Find in array:C230(DM_at_DataSources; "Business Kit")
If ($_l_SourcePosition<0)
	$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Business Kit")
	$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
	
End if 

Case of 
	: ($1=DM_al_DataSources{Find in array:C230(DM_at_DataSources; "Business Kit")})
		DM_t_DBContactCode:=""
		DM_t_CompanyCode:=""
		$_t_CompanyCode:=$4->
		$_l_GetCodeProcess:=New process:C317("DM_BKGetDBContactCode"; 256000; "Get BK ContactCode"; $1; $2; $3; $_t_CompanyCode; Current process:C322)
		Repeat 
			
			IDLE:C311
			$_l_ProcessState:=Process state:C330($_l_GetCodeProcess)
			If ($_l_GetCodeProcess>=0)
				DelayTicks(2)
			End if 
			$_l_ProcessState:=Process state:C330($_l_GetCodeProcess)
		Until ($_l_ProcessState<0) | (DM_t_DBContactCode#"") | (<>SYS_bo_QuitCalled)
		$4->:=DM_t_CompanyCode
		$0:=DM_t_DBContactCode
		
		//  $0:=DM_BKGetDBContactCode ($1;$2;$3;$4)
		//handle other sources here
		
		
	Else 
		$0:=$3
		
End case 
ERR_MethodTrackerReturn("DM_ValidateContactCode"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ValidateProductCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2010 17:15
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
	C_LONGINT:C283($_l_AddedItemID; $_l_DataSourceRow; $_l_ListID; $_l_Process; $_l_ProcessStates; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $0; $3; $4; DM_t_rProductCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateProductCode")

$0:=$3
//given that the current implementation will not
//include adding products to the business kit.
//the product WILL exist.but we still need to retreive to find the daybook product
ARRAY LONGINT:C221(DM_al_DataSources; 0)
ARRAY TEXT:C222(DM_at_DataSources; 0)
$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
$_l_DataSourceRow:=Find in array:C230(DM_at_DataSources; "Business Kit")
If ($_l_DataSourceRow<0)
	$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Business Kit")
	$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
	
End if 

Case of 
	: ($1=DM_al_DataSources{Find in array:C230(DM_at_DataSources; "Business Kit")})
		DM_t_rProductCode:=""
		$_l_Process:=New process:C317("DM_BKGetDBProductCode"; 256000; "Get BK ProductCode"; $1; $2; $3; $4; Current process:C322)
		Repeat 
			IDLE:C311
			$_l_ProcessStates:=Process state:C330($_l_Process)
			If ($_l_Process>=0)
				DelayTicks(2)
			End if 
			$_l_ProcessStates:=Process state:C330($_l_Process)
		Until ($_l_ProcessStates<0) | (DM_t_rProductCode#"") | (<>SYS_bo_QuitCalled)
		$0:=DM_t_rProductCode
		
		
		
		
	Else 
		$0:=$3
End case 
ERR_MethodTrackerReturn("DM_ValidateProductCode"; $_t_oldMethodName)
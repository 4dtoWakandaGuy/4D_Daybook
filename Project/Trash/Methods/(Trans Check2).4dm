//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans_Check2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     19/09/2010 15:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FiltersAvailable; $_bo_GraphsAvailable; $_bo_HideModuleBar; $_bo_SearchesAvailable; $_bo_SeletionsAvailable; $_bo_StatsAvailable; $_bo_TabsAvailable)
	C_LONGINT:C283($_l_DisplayRecordsTable; $_l_Module; $_l_Process; $_l_ViewType)
	C_TEXT:C284($_t_Context; $_t_oldMethodName; $_t_TableName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_Check2")
//Called by Trans_Check
//Modified NG Feb 2001 to set form sort and window size
If (Records in selection:C76([TRANSACTIONS:29])>0)
	$_t_Context:=""
	$_bo_TabsAvailable:=False:C215
	$_bo_HideModuleBar:=True:C214
	$_bo_SearchesAvailable:=False:C215
	$_bo_StatsAvailable:=False:C215
	$_bo_GraphsAvailable:=False:C215
	$_bo_FiltersAvailable:=False:C215
	$_bo_SeletionsAvailable:=False:C215
	$_l_Module:=Module_DataManager
	$_l_ViewType:=1
	$_t_TableName:=Table name:C256(Table:C252(->[TRANSACTIONS:29]))
	
	$_l_DisplayRecordsTable:=Table:C252(->[TRANSACTIONS:29])
	COPY NAMED SELECTION:C331([TRANSACTIONS:29]; "◊Preselection")
	$_l_Process:=New process:C317("DBI_DisplayRecords"; 128000; "VIEW"+$_t_TableName; $_l_DisplayRecordsTable; "◊Preselection"; $_t_Context; $_l_ViewType; $_bo_TabsAvailable; $_bo_HideModuleBar; $_bo_SearchesAvailable; Current process:C322; $_bo_StatsAvailable; $_bo_GraphsAvailable; $_bo_FiltersAvailable; $_bo_SeletionsAvailable; $_l_Module)
	
	
Else 
	Gen_Alert($1+Char:C90(13)+Char:C90(13)+Get localized string:C991("Text_NoneFound"); Get localized string:C991("OKButton"))
	
End if 
ERR_MethodTrackerReturn("Trans_Check2"; $_t_oldMethodName)

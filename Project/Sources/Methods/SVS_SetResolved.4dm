//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_SetResolved
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 20:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateSortOrder;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	C_BOOLEAN:C305($0; SVS_bo_PrefsLoaded)
	C_LONGINT:C283($_l_StateColumn; $_l_StateColumn2)
	C_TEXT:C284($_t_oldMethodName; $_t_StateCode; $_t_TableNumberSTR; $1; SVS_t_ResolvedCallState)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_SetResolved")

//SVS_SetResolved this method will set the resolved flag(really the old state)
//Based on a preference
If (Not:C34(SVS_bo_PrefsLoaded))
	SVS_LoadPreferences
End if 
$_t_TableNumberSTR:=String:C10((Table:C252(->[SERVICE_CALLS:20])); "000")
If (SVS_t_ResolvedCallState#"")
	$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])}; SVS_t_ResolvedCallState)
	If ($_l_StateColumn>0)
		//$SortSetting:=<>SYS_al_RecStateSortOrder{Table(->[SERVICE_CALLS])}{$_l_StateColumn}
		$_t_StateCode:=Substring:C12($1; Length:C16($_t_TableNumberSTR)+1; Length:C16($1))
		$_l_StateColumn2:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}; $_t_StateCode)
		If ($_l_StateColumn2>=$_l_StateColumn)
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	Else 
		$0:=False:C215
	End if 
Else   //use the name this is so we can work without setting up the preference.. a default if you like...
	$_l_StateColumn:=Find in array:C230(<>SYS_at_RecStateNames{Table:C252(->[SERVICE_CALLS:20])}; "Closed Service Request")
	If ($_l_StateColumn>0)
		$_t_StateCode:=Substring:C12($1; Length:C16($_t_TableNumberSTR)+1; Length:C16($1))
		$_l_StateColumn2:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}; $_t_StateCode)
		If ($_l_StateColumn2>=$_l_StateColumn)
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
	Else 
		$0:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("SVS_SetResolved"; $_t_oldMethodName)

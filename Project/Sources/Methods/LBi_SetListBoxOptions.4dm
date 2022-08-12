//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_SetListBoxOptions
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
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited; <>PER_bo_SystemSettingAccess; $_bo_AddDiaryTabs; $4)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_SetListBoxOptions")

If (Count parameters:C259>=2)
	If (Size of array:C274($1->)>0)
		ARRAY TEXT:C222($1->; 0)
		ARRAY LONGINT:C221($2->; 0)
	End if 
	APPEND TO ARRAY:C911($1->; "No Edit")
	APPEND TO ARRAY:C911($2->; 2)
	If ((<>PER_bo_SystemSettingAccess) & (<>PER_bo_LbDefinitiionsInited))
		APPEND TO ARRAY:C911($1->; "Item View Definition")
		APPEND TO ARRAY:C911($2->; 3)
		If (Count parameters:C259>=4)
			$_bo_AddDiaryTabs:=$4
		Else 
			$_bo_AddDiaryTabs:=False:C215
		End if 
		If ($_bo_AddDiaryTabs)
			APPEND TO ARRAY:C911($1->; "Diary Tab Settings")
			APPEND TO ARRAY:C911($2->; 4)
		End if 
	End if 
	If (Count parameters:C259>=3)
		//GET PICTURE FROM LIBRARY(20260; $3->)
		$3->:=Get_Picture(20260)
		
	End if 
End if 
ERR_MethodTrackerReturn("LBi_SetListBoxOptions"; $_t_oldMethodName)

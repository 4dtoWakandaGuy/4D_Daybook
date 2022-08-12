//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_DisableOnly
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 16:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_aMod;0)
	C_BOOLEAN:C305(DB_bo_ModuleSettingsinited)
	C_LONGINT:C283(<>MenuProc; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_DisableOnly")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Not:C34(DB_bo_ModuleSettingsinited))
	Check_Modules
	DB_bo_ModuleSettingsinited:=True:C214
End if 
If (Count parameters:C259=3)
	If (Size of array:C274(DB_aI_aMod)>=$1)
		If ((DB_GetModuleSettingByNUM($1))<2)
			DISABLE MENU ITEM:C150($2; $3; <>MenuProc)
		End if 
	End if 
Else 
	If (Size of array:C274(DB_aI_aMod)>=$1)
		If ((DB_GetModuleSettingByNUM($1))<2)
			DB_MenuAction($4; $5; 3; ""; <>MenuProc; False:C215)
			//DISABLE MENU ITEM($2;$3;◊MenuProc)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_DisableOnly"; $_t_oldMethodName)
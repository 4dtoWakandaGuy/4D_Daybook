//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_AccTypeDEF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; $0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_AccTypeDEF")
//Macro_AccTypeDEF - Used to over-ride code in the database
//insert a call to this method-with the name of the standard method name in $2.
//This will return true if the macro existed
//see also Macro_AccTypeFF

//C_TEXT($1)  `Name of the function

If (Count parameters:C259>=1)
	If (Not:C34(<>SYS_bo_ScriptonSave))
		If (DB_GetModuleSettingByNUM(Module_Macros)>0)
			<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
		End if 
	End if 
	If (<>SYS_bo_ScriptonSave)
		
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="Command "+"/"+$1)
		If (Records in selection:C76([SCRIPTS:80])>=1)
			$0:=True:C214
			Macro_AccType("Command "+"/"+$1; True:C214)
			
		Else 
			$0:=False:C215
		End if 
	Else 
		$0:=False:C215
		
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Macro_AccTypeDEF"; $_t_oldMethodName)

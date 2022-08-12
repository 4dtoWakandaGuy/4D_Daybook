//%attributes = {}
If (False:C215)
	//Project Method Name:      LL_SetHumanFieldName
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
	C_LONGINT:C283($1; $2; LL_l_FieldNum; LL_l_TableNUM)
	C_TEXT:C284($_t_oldMethodName; $0; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LL_SetHumanFieldName")
//This method is used to coerce field names-note these are for pop-ups SS LL_LoadFieldNamePrefs
//Of course this could sub and a function
If (Count parameters:C259>=1)
	LL_l_TableNUM:=$1
	LL_l_FieldNum:=$2  //so they can be used in the macro
	If (Macro_AccTypeDEF("SetHumanFieldName"))
	Else 
		
		Case of 
			: ($1=1)  // Table
				Case of 
					: ($2=Field:C253(->[CONTACTS:1]Contact_Name:31))
						
						$0:="Contact Name"  // I am doing this as an example
					Else 
						$0:=$3
						
				End case 
			Else 
				$0:=$3
		End case 
		
	End if 
End if 
ERR_MethodTrackerReturn("LL_SetHumanFieldName"; $_t_oldMethodName)
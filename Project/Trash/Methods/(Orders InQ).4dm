//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InQ
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/08/2012 17:18
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283(vAdd)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InQ")
Start_Process
vAdd:=1
OrdersV_File
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
	If (<>SYS_al_RecStateRestriction{24}{2}%2=1)
		Gen_InMidLay("Enter "+Substring:C12(<>SYS_at_RecStateNames{24}{2}; 1; 35); "OrMaster"; ->[ORDERS:24]; "InQAdd")
		Orders_Unload
	Else 
		Gen_Alert("You do not have access to this Record State"; "Cancel")
	End if 
Else 
	Gen_Alert("Suitable Record States have not been defined"; "Cancel")
End if 
Process_End
ERR_MethodTrackerReturn("Orders_InQ"; $_t_oldMethodName)
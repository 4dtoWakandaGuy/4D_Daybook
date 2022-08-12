//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contacts_ModE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vO)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_ModE")
Start_Process
Contacts_FileE
While (vO=1)
	Cont_Sel
	Gen_ModMid(Term_OrdWT("View Enquirers"); "OMaster"; ->[CONTACTS:1]; ->vO; "Contacts"; "")
End while 
Comp_Unload
Process_End
ERR_MethodTrackerReturn("Contacts_ModE"; $_t_oldMethodName)
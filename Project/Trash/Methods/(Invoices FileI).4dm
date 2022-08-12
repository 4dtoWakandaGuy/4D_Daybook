//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_FileI
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
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_FileI")
FORM SET INPUT:C55([INVOICES:39]; "Invoices_In13")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Invoices_In13"  //Added NG may 2004
ARRAY POINTER:C280(INV_aptr_ListboxSetup; 0)
ERR_MethodTrackerReturn("Invoices_FileI"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_ItInB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 09:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vButtDisINVITEM)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ItInB")
If ((DB_GetModuleSettingByNUM(1))=5)
	OBJECT SET ENTERABLE:C238([INVOICES_ITEMS:161]Price_Per:16; False:C215)
End if 
vButtDisINVITEM:="I DPMOS FSSSRCADT"
Input_Buttons(->[INVOICES:39]; ->vButtDisINVITEM)
ERR_MethodTrackerReturn("Invoices_ItInB"; $_t_oldMethodName)
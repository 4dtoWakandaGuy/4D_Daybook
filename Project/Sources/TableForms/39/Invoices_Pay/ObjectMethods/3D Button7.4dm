If (False:C215)
	//object Name: [INVOICES]Invoices_Pay.3D Button7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_Pay.3D Button7"; Form event code:C388)
WT_SORT_TABLE_3(->[INVOICES:39]; "Text8"; ->[INVOICES:39]Debtors_Account:15)
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_Pay.3D Button7"; $_t_oldMethodName)
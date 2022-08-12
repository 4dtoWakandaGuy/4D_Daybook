If (False:C215)
	//object Name: [INVOICES]Invoices_Out.3D Button14
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_Out.3D Button14"; Form event code:C388)
WT_SORT_TABLE_3(->[INVOICES:39]; "Text13"; ->[INVOICES:39]Analysis_Code:17)
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_Out.3D Button14"; $_t_oldMethodName)
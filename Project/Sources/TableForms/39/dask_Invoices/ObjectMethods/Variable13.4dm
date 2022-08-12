If (False:C215)
	//object Name: [INVOICES]dask_Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/03/2010 14:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(GEN_at_Identity;0)
	//Array TEXT(GEN_at_RecordCode;0)
	C_TEXT:C284($_t_oldMethodName; SO_t_OrderCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dask_Invoices.Variable13"; Form event code:C388)
SO_t_OrderCode:=GEN_at_RecordCode{GEN_at_Identity}
ERR_MethodTrackerReturn("OBJ [INVOICES].dask_Invoices.Variable13"; $_t_oldMethodName)
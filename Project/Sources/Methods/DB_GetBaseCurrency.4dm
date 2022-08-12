//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_GetBaseCurrency
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_CurrencyInited)
	C_TEXT:C284($_t_oldMethodName; $0; DB_t_BaseCurrency)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_GetBaseCurrency")
If (DB_bo_CurrencyInited)
	$0:=DB_t_BaseCurrency
Else 
	READ ONLY:C145([USER:15])
End if 
ERR_MethodTrackerReturn("DB_GetBaseCurrency"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      SF_MovementINDefaults
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2011 14:20 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PersAnOver)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SF_MovementINDefaults")
If ((<>PersAnOver) & ([SF_STOCKMOVEMENTS:193]Analysis_Code:18=""))
	[SF_STOCKMOVEMENTS:193]Analysis_Code:18:=<>Per_t_CurrentDefaultAnalCode
End if 
If ([SF_STOCKMOVEMENTS:193]Currency_Code:19="")
	[SF_STOCKMOVEMENTS:193]Currency_Code:19:=<>SYS_t_BaseCurrency
End if 
If ([SF_STOCKMOVEMENTS:193]Layer_Code:17="")
	[SF_STOCKMOVEMENTS:193]Layer_Code:17:=DB_GetLedgerActualLayer
End if 
ERR_MethodTrackerReturn("SF_MovementINDefaults"; $_t_oldMethodName)
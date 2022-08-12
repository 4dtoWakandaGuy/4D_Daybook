//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_InitCreditCardModule
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2009 17:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_Inited; <>CCM_bo_UseCoRef)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_InitCreditCardModule")


If (False:C215)
	CCM_LoadServiceProviders(True:C214)
Else 
	CCM_LoadServiceProvidersV11(True:C214)
	
End if 
<>CCM_bo_CompanyCards:=CCM_bo_CompanyCards
<>CCM_bo_UseCoRef:=CCM_bo_UseCoRef
<>CCM_bo_Inited:=True:C214
ERR_MethodTrackerReturn("CCM_InitCreditCardModule"; $_t_oldMethodName)
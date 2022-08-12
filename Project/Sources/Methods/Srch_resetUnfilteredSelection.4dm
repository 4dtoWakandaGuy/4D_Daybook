//%attributes = {}
If (False:C215)
	//Project Method Name:      Srch_resetUnfilteredSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: Srch_resetUnfilteredSelection
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>SearchNewStyle)
	C_BOOLEAN:C305(<>SearchNewStyle; COM_bo_UnfilteredSetKnown; PROD_bo_UnfilteredSetKnown; COM_bo_UnfilteredSetKnown; PROD_bo_UnfilteredSetKnown)
	C_LONGINT:C283(COM_l_SetID; PROD_l_SetID; $_l_TableNumber; COM_l_SetID; PROD_l_SetID)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Srch_resetUnfilteredSelection")

If (<>SearchNewStyle)
	$_l_TableNumber:=Table:C252($1)
	Case of 
		: ($_l_TableNumber=Table:C252(->[COMPANIES:2]))
			If (COM_bo_UnfilteredSetKnown)
				CLEAR SET:C117("CoSelection"+String:C10(COM_l_SetID))
			End if 
			COM_l_SetID:=0
			COM_l_SetID:=AA_GetNextID(->COM_l_SetID)
			CREATE SET:C116([COMPANIES:2]; "CoSelection"+String:C10(COM_l_SetID))
			COM_bo_UnfilteredSetKnown:=True:C214
		: ($_l_TableNumber=Table:C252(->[CONTACTS:1]))
			
		: ($_l_TableNumber=Table:C252(->[PRODUCTS:9]))
			If (PROD_bo_UnfilteredSetKnown)
				CLEAR SET:C117("ProdSelection"+String:C10(PROD_l_SetID))
			End if 
			PROD_l_SetID:=0
			PROD_l_SetID:=AA_GetNextID(->PROD_l_SetID)
			CREATE SET:C116([PRODUCTS:9]; "ProdSelection"+String:C10(PROD_l_SetID))
			PROD_bo_UnfilteredSetKnown:=True:C214
			
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			
	End case 
End if 
ERR_MethodTrackerReturn("Srch_resetUnfilteredSelection"; $_t_oldMethodName)

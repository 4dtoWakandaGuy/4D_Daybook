If (False:C215)
	//object Name: [INVOICES]dask_Variable10
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
	//ARRAY BOOLEAN(SO_l_LBCont;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dask_Invoices.Variable10"; Form event code:C388)
If (GEN_at_Identity>1)
	GEN_at_Identity:=GEN_at_Identity-1
	GEN_at_Name:=GEN_at_Name-1
	GEN_at_RecordCode:=GEN_at_RecordCode-1
	LISTBOX SELECT ROW:C912(SO_l_LBCont; GEN_at_Identity; 0)
	LB_SetScroll(->SO_l_LBCont; GEN_at_Identity)
	SVS_at_PreviewEvent:=SVS_at_PreviewEvent-1
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dask_Invoices.Variable10"; $_t_oldMethodName)

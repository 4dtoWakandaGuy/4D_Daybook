If (False:C215)
	//object Name: [CONTACTS]dask_Contact2.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_LBCont;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dask_Contact2.Variable10"; Form event code:C388)
If (GEN_at_Identity>1)
	GEN_at_Identity:=GEN_at_Identity-1
	GEN_at_Name:=GEN_at_Name-1
	GEN_at_RecordCode:=GEN_at_RecordCode-1
	LISTBOX SELECT ROW:C912(CON_lb_LBCont; GEN_at_Identity; 0)
	LB_SetScroll(->CON_lb_LBCont; GEN_at_Identity)
	SVS_at_PreviewEvent:=SVS_at_PreviewEvent-1
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dask_Contact2.Variable10"; $_t_oldMethodName)

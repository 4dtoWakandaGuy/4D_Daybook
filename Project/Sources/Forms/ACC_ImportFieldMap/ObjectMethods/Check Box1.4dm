If (False:C215)
	//object Method Name: Object Name:      ACC_ImportFieldMap.Check Box1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/02/2012 17:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_Lb_StatementMap;0)
	//ARRAY TEXT(ACC_at_QIFDBFields;0)
	//ARRAY TEXT(ACC_at_QIFFields;0)
	//ARRAY TEXT(ACC_at_SwapView;0)
	C_BOOLEAN:C305(ACC_bo_AddQIFFormat)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284($_t_oldMethodName; ACC_t_editType)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/ACC_ImportFieldMap/Check Box1"; Form event code:C388)
$_l_FormEvent:=Form event code:C388

Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		ARRAY TEXT:C222(ACC_at_SwapView; 2)
		OBJECT SET VISIBLE:C603(ACC_at_SwapView; True:C214)
		ACC_at_SwapView{1}:="CSV import Format"
		ACC_at_SwapView{2}:="QIF import Format"
		ACC_at_SwapView:=2
		ACC_t_editType:="QIF"
		OBJECT SET VISIBLE:C603(ACC_bo_AddQIFFormat; False:C215)
		OBJECT SET VISIBLE:C603(ACC_t_editType; False:C215)
		
		LB_SetupListbox(->ACC_Lb_StatementMap; "ABC_t"; "ABC_L"; 1; ->ACC_at_QIFFields; ->ACC_at_QIFDBFields)
		LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
		
		
		LB_SetColumnWidths(->ACC_Lb_StatementMap; "ABC_t"; 1; 150; 150)
		LB_SetEnterable(->ACC_Lb_StatementMap; False:C215; 0)
		LB_SetScroll(->ACC_Lb_StatementMap; -3; -2)
		LB_StyleSettings(->ACC_Lb_StatementMap; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
End case 
ERR_MethodTrackerReturn("OBJ ACC_ImportFieldMap.Check Box1"; $_t_oldMethodName)

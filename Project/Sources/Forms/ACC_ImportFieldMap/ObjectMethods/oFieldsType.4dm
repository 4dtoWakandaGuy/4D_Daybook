If (False:C215)
	//object Method Name: Object Name:      ACC_ImportFieldMap.oFieldsType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2012 15:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_Lb_StatementMap;0)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	//ARRAY TEXT(ACC_at_QIFDBFields;0)
	//ARRAY TEXT(ACC_at_QIFFields;0)
	//ARRAY TEXT(ACC_at_StatementFields;0)
	//ARRAY TEXT(ACC_at_SwapView;0)
	C_TEXT:C284($_t_oldMethodName; ACC_t_editType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportFieldMap.oFieldsType"; Form event code:C388)

Case of 
	: (ACC_at_SwapView=1)
		ACC_t_editType:="CSV"
	: (ACC_at_SwapView=2)
		ACC_t_editType:="QIF"
End case 
Case of 
	: (ACC_t_editType="CSV")
		LB_SetupListbox(->ACC_Lb_StatementMap; "ABC_t"; "ABC_L"; 1; ->ACC_at_StatementFields; ->ACC_at_DaybookFields)
		LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
	: (ACC_t_editType="QIF")
		LB_SetupListbox(->ACC_Lb_StatementMap; "ABC_t"; "ABC_L"; 1; ->ACC_at_QIFFields; ->ACC_at_QIFDBFields)
		LB_SetColumnHeaders(->ACC_Lb_StatementMap; "ABC_L"; 1; "Statement Field"; "Associated Daybook Field")
		
End case 
LB_SetColumnWidths(->ACC_Lb_StatementMap; "ABC_t"; 1; 150; 150)
LB_SetEnterable(->ACC_Lb_StatementMap; False:C215; 0)
LB_SetEnterable(->ACC_Lb_StatementMap; True:C214; 1)
LB_SetEnterable(->ACC_Lb_StatementMap; True:C214; 2)

LB_SetScroll(->ACC_Lb_StatementMap; -3; -2)
LB_StyleSettings(->ACC_Lb_StatementMap; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
ERR_MethodTrackerReturn("OBJ ACC_ImportFieldMap.oFieldsType"; $_t_oldMethodName)

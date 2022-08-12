If (False:C215)
	//object Name: [COMPANIES]dRelate_List.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Companies;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dRelate_List.Variable7"; Form event code:C388)
If (GEN_at_Name>1)
	GEN_at_Name:=GEN_at_Name-1
	GEN_at_Identity:=GEN_at_Identity-1
	LISTBOX SELECT ROW:C912(COM_lb_Companies; GEN_at_Name; 0)
	LB_SetScroll(->COM_lb_Companies; GEN_at_Identity)
End if 
ERR_MethodTrackerReturn("OBJ:dRelate_List,$Up"; $_t_oldMethodName)

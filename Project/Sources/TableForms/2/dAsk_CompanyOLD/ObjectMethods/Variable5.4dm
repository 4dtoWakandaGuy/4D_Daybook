If (False:C215)
	//object Name: [COMPANIES]dAsk_CompanyOLD.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
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
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283(bd1; ch1; ch2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_CompanyOLD.Variable5"; Form event code:C388)
If ((ch2=0) & (ch1=0))
	ch2:=1
End if 
USE SET:C118("Master2")
If (ch1=0)
	QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
	If (Records in selection:C76([COMPANIES:2])>0)
		Companies_Arr
		SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Identity; GEN_at_Name; >)
		Array_LCStart
		LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
		LB_SetScroll(->COM_lb_Companies; 1)
	Else 
		Gen_Alert("No Private Individuals found")
		USE SET:C118("Master2")
		ch1:=1
		ch2:=0
	End if 
Else 
	Companies_Arr
	SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Identity; GEN_at_Name; >)
	Array_LCStart
	LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
	LB_SetScroll(->COM_lb_Companies; 1)
End if 
bd1:=Size of array:C274(GEN_at_Name)
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_CompanyOLD.Variable5"; $_t_oldMethodName)
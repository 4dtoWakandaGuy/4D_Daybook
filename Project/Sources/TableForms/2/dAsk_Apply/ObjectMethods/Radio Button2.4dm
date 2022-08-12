If (False:C215)
	//object Name: [COMPANIES]dAsk_Apply.Radio Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 02:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>QV_isHidden)
	C_LONGINT:C283($_l_TableNumber; GEN_l_CurrentTable)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Apply.Radio Button2"; Form event code:C388)

//bsw 12/08/04
<>QV_isHidden:=False:C215

If (Records in set:C195("listboxset0")>0)
	USE SET:C118("listboxset0")
End if 


$_l_TableNumber:=GEN_l_CurrentTable
$_ptr_Table:=Table:C252(GEN_l_CurrentTable)
READ WRITE:C146($_ptr_Table->)
CREATE SET:C116($_ptr_Table->; "<>QVSet"+String:C10(GEN_l_CurrentTable))

QV_ApplyQualities($_l_TableNumber; -9999; "<>QVSet"+String:C10(GEN_l_CurrentTable))
HIDE WINDOW:C436
Repeat 
	DelayTicks(10)
	
Until (<>QV_isHidden=True:C214)
SHOW WINDOW:C435
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Apply.Radio Button2"; $_t_oldMethodName)

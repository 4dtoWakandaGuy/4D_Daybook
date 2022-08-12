If (False:C215)
	//object Name: [CONTACTS]LAB_SelectL7160.Variable1
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
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_TableNumber; Lab_but_data1; Lab_but_data10; Lab_but_data11; Lab_but_data12; Lab_but_data13; Lab_but_data14; Lab_but_data15; Lab_but_data16)
	C_LONGINT:C283(Lab_but_data17; Lab_but_data18; Lab_but_data19; Lab_but_data2; Lab_but_data20; Lab_but_data21; Lab_but_data3; Lab_but_data4; Lab_but_data5; Lab_but_data6; Lab_but_data7)
	C_LONGINT:C283(Lab_but_data8; Lab_but_data9)
	C_POINTER:C301($_ptr_Button; $_ptr_LabelButton)
	C_TEXT:C284($_t_oldMethodName; LAB_t_BUTTON)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].LAB_SelectL7160.Variable1"; Form event code:C388)
$_ptr_LabelButton:=Self:C308
RESOLVE POINTER:C394($_ptr_LabelButton; LAB_t_BUTTON; $_l_TableNumber; $_l_FieldNumber)
For ($_l_Index; 1; 21)
	IDLE:C311  // 7/04/03 pb
	$_ptr_Button:=Get pointer:C304("Lab_but_data"+String:C10($_l_Index))
	If ($_l_Index<Num:C11(LAB_t_BUTTON))
		OBJECT SET TITLE:C194($_ptr_Button->; "X")
	Else 
		OBJECT SET TITLE:C194($_ptr_Button->; "")
	End if 
End for 
ERR_MethodTrackerReturn("OBJ [CONTACTS].LAB_SelectL7160.Variable1"; $_t_oldMethodName)

If (False:C215)
	//object Name: [USER]GEN_Calender.Variable87
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; CAL_D_CurrentViewDate; vCalT)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].GEN_Calender.Variable87"; Form event code:C388)
vCalT:=vCalT+5

For ($_l_Index; 1; 37)
	$_ptr_Variable:=Get pointer:C304("VD"+String:C10($_l_Index))
	$_ptr_Variable->:=""
	$_ptr_Variable:=Get pointer:C304("bD"+String:C10($_l_Index))
	OBJECT SET ENABLED:C1123($_ptr_Variable->; False:C215)
End for 
CAL_D_CurrentViewDate:=vCalT
vCalPeriod:=Diary_CalPer(<>DB_d_CurrentDate; CAL_D_CurrentViewDate; ->vCalF; ->VCalT; ->vPeriod; ->SD_t_Periodstr)
ERR_MethodTrackerReturn("OBJ [USER].GEN_Calender.Variable87"; $_t_oldMethodName)

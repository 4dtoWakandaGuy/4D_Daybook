If (False:C215)
	//object Name: [USER]GEN_Calender.Variable86
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
	C_DATE:C307(CAL_D_CurrentViewDate; vCalF; VCalT)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; SD_t_Periodstr; vCalPeriod; vPeriod)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].GEN_Calender.Variable86"; Form event code:C388)
vCalF:=vCalF-25

For ($_l_Index; 1; 37)
	$_ptr_Variable:=Get pointer:C304("VD"+String:C10($_l_Index))
	$_ptr_Variable->:=""
	$_ptr_Variable:=Get pointer:C304("bD"+String:C10($_l_Index))
	OBJECT SET ENABLED:C1123($_ptr_Variable->; False:C215)
End for 
CAL_D_CurrentViewDate:=vCalf
vCalPeriod:=Diary_CalPer(Current date:C33(*); CAL_D_CurrentViewDate; ->vCalF; ->VCalT; ->vPeriod; ->SD_t_Periodstr)
ERR_MethodTrackerReturn("OBJ [USER].GEN_Calender.Variable86"; $_t_oldMethodName)

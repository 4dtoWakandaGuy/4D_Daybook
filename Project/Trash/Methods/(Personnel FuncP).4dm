//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Personnel FuncP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Set)
	C_LONGINT:C283($_l_Functionality; $_l_Index; bd1; bd2; bd20; bd3; bd4; bd5; bd6; bd7)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel FuncP")
If (False:C215)
	bd1:=0
	bd2:=0
	bd3:=0
	bd4:=0
	bd5:=0
	bd6:=0
	bd7:=0
	Case of 
		: (bd20=1)
			bd1:=1
		: (bd20=2)
			bd1:=1
			bd2:=1
		: (bd20=3)
			bd1:=1
			bd2:=1
			bd3:=1
		: (bd20=4)
			bd1:=1
			bd2:=1
			bd3:=1
			bd4:=1
		: (bd20=5)
			bd1:=1
			bd2:=1
			bd3:=1
			bd4:=1
			bd5:=1
		: (bd20=6)
			bd1:=1
			bd2:=1
			bd3:=1
			bd4:=1
			bd5:=1
			bd6:=1
		: (bd20=7)
			bd1:=1
			bd2:=1
			bd3:=1
			bd4:=1
			bd5:=1
			bd6:=1
			bd7:=0
	End case 
Else 
	//using bitwize
	$_l_Functionality:=[PERSONNEL:11]Functionality:33
	For ($_l_Index; 1; 8)
		$_ptr_Variable:=Get pointer:C304("bd"+String:C10($_l_Index))
		$_bo_Set:=[PERSONNEL:11]Functionality:33 ?? $_l_Index
		$_ptr_Variable->:=Num:C11(([PERSONNEL:11]Functionality:33 ?? $_l_Index))
		If ($_bo_Set)
			Bd20:=$_l_Index
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("Personnel FuncP"; $_t_oldMethodName)

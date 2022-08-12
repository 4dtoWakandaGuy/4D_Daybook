//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Unload
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 10:00:51If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_LastTableNum)
	C_POINTER:C301($_ptr_table)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen Unload")
//General Unload - unloads all records
$_l_LastTableNum:=Get last table number:C254
$_l_Index:=1
While ($_l_Index<=$_l_LastTableNum)
	If (Is table number valid:C999($_l_Index))
		IDLE:C311  // 03/04/03 pb
		$_ptr_table:=Table:C252($_l_Index)
		UNLOAD RECORD:C212($_ptr_table->)
		$_l_Index:=$_l_Index+1
	End if 
End while 
ERR_MethodTrackerReturn("Gen Unload"; $_t_oldMethodName)
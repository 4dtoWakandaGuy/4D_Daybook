//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DIFFOPTIMISE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/12/2010 11:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_DataLength; $_l_End; $_l_Start)
	C_POINTER:C301($_ptr_Data; $_ptr_Mod; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DIFFOPTIMISE")
// ----------------------------------------------------
// User name (OS): ddancy
// Date and time: 18/02/08, 16:03:51
// ----------------------------------------------------
// Method: _DIFF_Optimise
// Description
//
//
// Parameters
// ----------------------------------------------------

$_ptr_Data:=$1
$_ptr_Mod:=$2

$_l_Start:=0
$_l_DataLength:=Size of array:C274($_ptr_Data->)+1

While ($_l_Start<$_l_DataLength)
	$_bo_Continue:=True:C214
	
	While ($_bo_Continue)
		If ($_l_Start<$_l_DataLength)
			If ($_ptr_Mod->{$_l_Start}=False:C215)
				$_l_Start:=$_l_Start+1
			Else 
				$_bo_Continue:=False:C215
			End if 
		Else 
			$_bo_Continue:=False:C215
		End if 
	End while 
	
	$_l_End:=$_l_Start
	$_bo_Continue:=True:C214
	While ($_bo_Continue)
		If ($_l_End<$_l_DataLength)
			If ($_ptr_Mod->{$_l_End}=True:C214)
				$_l_End:=$_l_End+1
			Else 
				$_bo_Continue:=False:C215
			End if 
		Else 
			$_bo_Continue:=False:C215
		End if 
	End while 
	
	If ($_l_End<$_l_DataLength)
		If ($_ptr_Data->{$_l_Start}=$_ptr_Data->{$_l_End})
			$_ptr_Mod->{$_l_Start}:=False:C215
			$_ptr_Mod->{$_l_End}:=True:C214
		Else 
			$_l_Start:=$_l_End
		End if 
	Else 
		$_l_Start:=$_l_End
	End if 
	
End while 
ERR_MethodTrackerReturn("DB_DIFFOPTIMISE"; $_t_oldMethodName)
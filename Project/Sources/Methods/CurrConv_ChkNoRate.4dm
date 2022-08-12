//%attributes = {}
If (False:C215)
	//Project Method Name:      CurrConv_ChkNoRate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(aPrevTypeC;0)
	//ARRAY TEXT(SVS_at_PreviewNote;0)
	C_LONGINT:C283($_l_Index; $_l_NoteRow)
	C_TEXT:C284($_t_oldMethodName; vCallCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CurrConv_ChkNoRate")
$_l_Index:=1
While ($_l_Index<=Size of array:C274(aPrevTypeC))
	IDLE:C311  // 03/04/03 pb
	$_l_NoteRow:=Find in array:C230(SVS_at_PreviewNote; aPrevTypeC{$_l_Index})
	If ((GEN_ar_Value{$_l_Index}=0) & ($_l_NoteRow>0))
		If (aPrevTypeC{$_l_Index}#vCallCode)
			Gen_Alert("No Currency Rate has been found for "+aPrevTypeC{$_l_Index}+" - it will be set to parity"; "")
		End if 
		GEN_ar_Value{$_l_Index}:=1
	End if 
	$_l_Index:=$_l_Index+1
End while 
ERR_MethodTrackerReturn("CurrConv_ChkNoRate"; $_t_oldMethodName)
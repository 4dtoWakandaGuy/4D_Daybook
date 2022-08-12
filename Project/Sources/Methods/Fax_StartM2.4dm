//%attributes = {}
If (False:C215)
	//Project Method Name:      Fax_StartM2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(FAX_D_FaxParam3; vDate)
	C_LONGINT:C283(<>FaxMode; $_l_Error; $0; bd10; FAX_Return; u2)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; FAX_T_FaxParam3; FAX_T_FaxParam4; FAX_T_FaxParam5; FaxParam3; FaxParam4; vConfirm; VFrom)
	C_TEXT:C284(Vsearch; Vt)
	C_TIME:C306(FAX_ti_FaxParam4; VTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax_StartM2")
//Fax_StartM2 - a non-SP specific version
Case of 
	: (<>FaxMode=1)
		FaxParam3:=$2
		FaxParam4:=$3
		FAX_Return:=0
		PLUGCALL_FAX("SetDetails"; 1; $1; ->FaxParam3; ->FaxParam4; ->FAX_Return)
		$_l_Error:=FAX_Return
		If ($_l_Error=0)
			If (u2=1)
				FAX_Return:=0
				FAX_D_FaxParam3:=vDate
				FAX_ti_FaxParam4:=VTime
				PLUGCALL_FAX("SetDetails"; 1; $1; ->FAX_D_FaxParam3; ->FAX_ti_FaxParam4; ->FAX_Return)
				$_l_Error:=FAX_Return
			End if 
			If ($_l_Error=0)
				If (bd10=1)
					FAX_T_FaxParam3:=VFrom
					FAX_T_FaxParam4:=vConfirm
					FAX_T_FaxParam5:=Vt
					PLUGCALL_FAX("SetCover"; 1; Vsearch; ->FAX_T_FaxParam3; ->FAX_T_FaxParam4; ->FAX_T_FaxParam5; ->FAX_Return)
					$_l_Error:=FAX_Return
					
				End if 
			End if 
		End if 
	: (<>FaxMode=2)
		$_l_Error:=Fax_SPStartM2($1; $2; $3)
End case 
$0:=$_l_Error
ERR_MethodTrackerReturn("Fax_StartM2"; $_t_oldMethodName)
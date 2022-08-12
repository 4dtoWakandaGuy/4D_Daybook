//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ConfirmPassword
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/02/2010 13:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_SetNewPassword; $0; $2; $3; GEN_bo_Autoquit; GEN_bo_NoVerifyUser; GEN_bo_ShowChangeAccess; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; i; WIN_l_CurrentWinRef; xNext)
	C_TEXT:C284(<>DB_t_Password; <>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_Password1; $1; $5; Vrequest)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ConfirmPassword")
//TRACE
//this method will show the password entry form
//and return ok if the user enters the correct password.
i:=1
Open_AnyTypeWindow(100; 320; 1; "")  //;"User: "+◊User)
If (Count parameters:C259=0)
	vRequest:="Please confirm "+<>PER_t_CurrentUserInitials+"'s Id"
Else 
	Vrequest:=($1)
End if 
If (Count parameters:C259>=2)
	GEN_bo_Autoquit:=$2
Else 
	GEN_bo_Autoquit:=True:C214
End if 
If (Count parameters:C259>=3)
	GEN_bo_ShowChangeAccess:=$3
Else 
	GEN_bo_ShowChangeAccess:=True:C214
End if 
GEN_bo_NoVerifyUser:=False:C215
If (Count parameters:C259>=4)
	GEN_bo_NoVerifyUser:=True:C214
	$_bo_SetNewPassword:=True:C214
Else 
	$_bo_SetNewPassword:=False:C215
End if 
xNext:=0
<>DB_t_Password:=""
DIALOG:C40([COMPANIES:2]; "dAsk_Id")
If ($_bo_SetNewPassword) & (<>DB_t_Password#"")
	If (Count parameters:C259>=5)
		If (<>DB_t_Password=$5)
			$0:=True:C214
		Else 
			$0:=False:C215
		End if 
		$_bo_Continue:=False:C215
	Else 
		$_t_Password1:=<>DB_t_Password
		<>DB_t_Password:=""
		Vrequest:="Re-enter password for confirmation"
		DIALOG:C40([COMPANIES:2]; "dAsk_Id")
		$_bo_Continue:=False:C215
		If ($_t_Password1=<>DB_t_Password)
			$_bo_Continue:=True:C214
		End if 
	End if 
Else 
	If (<>DB_t_Password#"")
		$_bo_Continue:=True:C214
	End if 
End if 

CLOSE WINDOW:C154
$_l_OK:=Num:C11((OK=1) & ($_bo_Continue))
OK:=1
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 
If (Not:C34($_bo_SetNewPassword))
	If ($_l_OK=1)
		If (xNext=1)
			Change_AccessP
		Else 
			$0:=True:C214
			Start_Event
		End if 
	Else 
		$0:=False:C215
	End if 
Else 
	If (Count parameters:C259<5)
		$0:=$_bo_Continue
		PW_Return:=<>DB_t_Password
	End if 
End if 
ERR_MethodTrackerReturn("Gen_ConfirmPassword"; $_t_oldMethodName)

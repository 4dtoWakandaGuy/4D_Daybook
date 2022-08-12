//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_PlayWEnd
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
	C_BOOLEAN:C305($_bo_End)
	C_LONGINT:C283($_l_CurrentWhileLevel; $0; $1)
	C_TEXT:C284($_t_Command; $_t_oldMethodName; Macro_F; vMT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_PlayWEnd")
//Record_PlayWEnd - ends while & for loops

$_l_CurrentWhileLevel:=$1
$_bo_End:=False:C215
While ((Length:C16(vMT)>3) & ($_bo_End=False:C215))
	IDLE:C311  // 7/04/03 pb
	Macro_F:=""
	Record_PlayLinS(->Macro_F)
	$_t_Command:=Macro_F
	Case of 
		: ($_t_Command="While")
			$1:=$1+1
		: ($_t_Command="End while")
			If ($1=$_l_CurrentWhileLevel)
				$_bo_End:=True:C214
			End if 
			$1:=$1-1
		: ($_t_Command="Repeat")
			$1:=$1+1
		: ($_t_Command="Until")
			$1:=$1-1
		: ($_t_Command="For")
			$1:=$1+1
		: ($_t_Command="ForCont")
			$1:=$1+1
		: ($_t_Command="End for")
			If ($1=$_l_CurrentWhileLevel)
				$_bo_End:=True:C214
			End if 
			$1:=$1-1
	End case 
End while 
$0:=$1
ERR_MethodTrackerReturn("Record_PlayWEnd"; $_t_oldMethodName)

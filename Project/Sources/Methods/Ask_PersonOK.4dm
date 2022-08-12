//%attributes = {}
If (False:C215)
	//Project Method Name:      Ask_PersonOK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2009 10:16`Method: Ask_PersonOK
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>LIC_bo_skipVersionControlOnExit; PW_Bo_shake)
	C_LONGINT:C283($_l_CalculatedResponseResult; $_l_Index; $_l_Length; $_l_LoginSuccess; $_l_ResponseasNumber; $_l_ResponseasNumberRep; PER_l_LoginAttempts)
	C_TEXT:C284(<>DB_t_PassLock; <>DB_t_Password; <>PER_t_CurrentUserInitials; $_t_EnteredResponse; $_t_NumberasText; $_t_oldMethodName; $_t_Passsword; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ask_PersonOK"; 0; <>DB_t_Password)
If (Count parameters:C259>=1)
	$_t_Passsword:=$1
Else 
	$_t_Passsword:=<>DB_t_Password
End if 
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
If ($_t_Passsword="Help")
	Gen_Confirm("Only use this Help function if none of the users know their User Id"; ""; "")
	If (OK=1)
		$_t_NumberasText:=""
		$_l_Index:=1
		For ($_l_Index; 1; 8)
			//While ($_l_Index<9)
			IDLE:C311  // 03/04/03 pb
			$_t_NumberasText:=$_t_NumberasText+String:C10(Random:C100%(9)+1)
			//$_l_Index:=$_l_Index+1
			//End while
		End for 
		Gen_Confirm("Call Daybook Group and quote this number: "+Char:C90(13)+$_t_NumberasText; ""; "")
		If (OK=1)
			$_t_EnteredResponse:=Gen_Request("Type in their response:")
			If (OK=1)
				$_l_ResponseasNumber:=Num:C11($_t_NumberasText)
				$_l_ResponseasNumberRep:=Num:C11($_t_EnteredResponse)
				$_l_CalculatedResponseResult:=Int:C8((($_l_ResponseasNumber/84)*59)-55555)
				//   ALERT(String($_l_ResponseasNumberRep)+Char(13)+String($_l_CalculatedResponseResult))
				If ($_l_CalculatedResponseResult=$_l_ResponseasNumberRep)
					Gen_Alert("You have been granted access this time only"+Char:C90(13)+Char:C90(13)+"Please now change your User Id ..."; "")
					READ WRITE:C146([PERSONNEL:11])
					LOAD RECORD:C52([PERSONNEL:11])
					PersonnelSetID
					DB_SaveRecord(->[PERSONNEL:11])
					AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
					READ ONLY:C145([PERSONNEL:11])
					$_t_Passsword:=[PERSONNEL:11]Person_Identity:13
				End if 
			End if 
		End if 
	End if 
	OK:=1
End if 
$_l_LoginSuccess:=1
If (Length:C16([PERSONNEL:11]Person_Identity:13)=Length:C16($_t_Passsword))
	$_l_Index:=1
	$_l_Length:=Length:C16($_t_Passsword)
	For ($_l_Index; 1; $_l_Length)
		//While ($_l_Index<=Length($_t_Passsword))
		If (Character code:C91(Substring:C12([PERSONNEL:11]Person_Identity:13; $_l_Index; 1))#Character code:C91(Substring:C12($_t_Passsword; $_l_Index; 1)))
			$_l_LoginSuccess:=2
		End if 
		//$_l_Index:=$_l_Index+1
		//End while
	End for 
Else 
	$_l_LoginSuccess:=2
End if 
If (PER_l_LoginAttempts=0)
	PER_l_LoginAttempts:=1
End if 
If ($_l_LoginSuccess=1)
	ACCEPT:C269
Else 
	If (PER_l_LoginAttempts>2)
		<>LIC_bo_skipVersionControlOnExit:=True:C214
		Quit
		
	Else 
		//Gen_Alert ("Incorrect User Id";"Try again")
		PW_Bo_shake:=True:C214
		POST OUTSIDE CALL:C329(Current process:C322)
		<>DB_t_PassLock:=""
		$_t_Passsword:=""
	End if 
End if 
PER_l_LoginAttempts:=PER_l_LoginAttempts+1
If (Count parameters:C259>=1)
	$0:=$_t_Passsword
Else 
	<>DB_t_Password:=$_t_Passsword
End if 
ERR_MethodTrackerReturn("Ask_PersonOK"; $_t_oldMethodName)

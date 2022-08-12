//%attributes = {}
If (False:C215)
	//Project Method Name:      SMS_IntlPhoneNumber
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
	C_BOOLEAN:C305($_bo_ReadOnly)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_DiallingCode; $_t_Message; $_t_oldMethodName; $_t_Telephone; $_t_VariableName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_IntlPhoneNumber")
// SMS_IntlPhoneNumber
// Takes a phone number and converts it into the international format
// if it isn't already
// 02/05/02 pb
// parameters: $1=pointer to the original number
// Returns the no. in internaitonal format
If (Count parameters:C259>=1)
	$_t_Telephone:=Replace string:C233($1->; " "; "")
	$_bo_ReadOnly:=False:C215
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	Case of 
		: ($_t_Telephone[[1]]="+")
			// Okey dokey - we will assume it is OK
		: (($_t_Telephone[[1]]="4") & ($_t_Telephone[[2]]="4"))
			$_t_Telephone:="+"+$_t_Telephone
		: (($_t_Telephone[[1]]="0") & ($_t_Telephone[[2]]="7"))  // any UK mobile no.
			$_t_Telephone:="+44"+Substring:C12($_t_Telephone; 2)
			//  : ($_t_Telephone≤1≥#"+")
		: ($_t_VariableName#"")  // the no. is not linked to a Contact record -- it's a variable
			// skip through - it will be rejected at end
		Else 
			If ($_t_Telephone[[1]]="0")
				$_t_Telephone:=Substring:C12($_t_Telephone; 2)
			End if 
			If ([COMPANIES:2]Country:8#"")
				If (Read only state:C362([COUNTRIES:73])=True:C214)
					$_bo_ReadOnly:=True:C214
					READ WRITE:C146([COUNTRIES:73])
				End if 
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				If ([COUNTRIES:73]Dialling_Code:5#"")
					$_t_Telephone:="+"+[COUNTRIES:73]Dialling_Code:5+$_t_Telephone
				Else 
					$_t_DiallingCode:=SMS_DiallingCodesLookup(->[COUNTRIES:73]COUNTRY_CODE:1)
					If ($_t_DiallingCode="")
						$_t_DiallingCode:=Request:C163("What is the International Dialling code for "+[COUNTRIES:73]COUNTRY_CODE:1+"?")
						If ($_t_DiallingCode#"")
							[COUNTRIES:73]Dialling_Code:5:=$_t_DiallingCode
							DB_SaveRecord(->[COUNTRIES:73])
							$_t_Telephone:="+"+[COUNTRIES:73]Dialling_Code:5+$_t_Telephone
						End if 
					End if 
				End if 
			End if 
	End case 
	If ($_t_Telephone[[1]]#"+")  // we haven't been able to fix it
		$_t_Message:=$_t_Telephone+" does not appear to be a valid mobile number. "
		$_t_Message:=$_t_Message+" Please retry, entering the number in international format -- "
		$_t_Message:=$_t_Message+"e.g. '+337778888'"
		//  ALERT($_t_Message)
		Gen_Alert($_t_Message)
		$_t_Telephone:=""
	End if 
	UNLOAD RECORD:C212([COUNTRIES:73])
	If ($_bo_ReadOnly)
		READ ONLY:C145([COUNTRIES:73])
	End if 
	
	$0:=$_t_Telephone
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("SMS_IntlPhoneNumber"; $_t_oldMethodName)

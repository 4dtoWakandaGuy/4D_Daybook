//%attributes = {}
If (False:C215)
	//Project Method Name:      servicesettablestate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: servicesettablestate
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_LONGINT:C283($_l_StateCodeColumn; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_StateCode; $_t_TableSTR; $0; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("servicesettablestate")

//C_LONGINT($1)


//If ([service calls]Status<$1)
//[service calls]Status:=[service calls]Status+1
//service calls Title
//DB_bo_RecordModified:=True
//End if
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (Count parameters:C259>=1)
	$0:=$2
	If ($1=1)  //Up a state
		$_t_TableSTR:=String:C10((Table:C252(->[SERVICE_CALLS:20])); "000")
		$_t_StateCode:=Substring:C12($2; Length:C16($_t_TableSTR)+1; Length:C16($2))  //the current state code
		$_l_StateCodeColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}; $_t_StateCode)
		If ($_l_StateCodeColumn<Size of array:C274(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}))
			$0:=String:C10(Table:C252(->[SERVICE_CALLS:20]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{$_l_StateCodeColumn+1}
		Else 
			$0:=String:C10(Table:C252(->[SERVICE_CALLS:20]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{$_l_StateCodeColumn}
		End if 
	Else 
		$_t_TableSTR:=String:C10((Table:C252(->[SERVICE_CALLS:20])); "000")
		$_t_StateCode:=Substring:C12($2; Length:C16($_t_TableSTR)+1; Length:C16($2))
		$_l_StateCodeColumn:=Find in array:C230(<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}; $_t_StateCode)
		If ($_l_StateCodeColumn>1)
			$0:=String:C10(Table:C252(->[SERVICE_CALLS:20]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{$_l_StateCodeColumn-1}
		Else 
			$0:=String:C10(Table:C252(->[SERVICE_CALLS:20]); "000")+<>SYS_at_RecStateCodes{Table:C252(->[SERVICE_CALLS:20])}{$_l_StateCodeColumn}
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("servicesettablestate"; $_t_oldMethodName)

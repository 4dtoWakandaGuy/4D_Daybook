//%attributes = {}
If (False:C215)
	//Project Method Name:      Uppers2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2010 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_AutoCapitalization; $_l_Capitalise; $_l_Option; $2; $3)
	C_TEXT:C284($_t_ModifiedFIeldValue; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Uppers2")
//Uppers2
If (Count parameters:C259>=3)
	$_l_Capitalise:=$3
Else 
	$_l_Capitalise:=<>SYS_l_AutoCapitalization
End if 
If (Count parameters:C259>=1)
	If (Length:C16($1)>0)
		If (Count parameters:C259>=2)
			$_l_Option:=$2
		Else 
			$_l_Option:=0
		End if 
		Case of 
			: ($_l_Capitalise=0)
				If (Count parameters:C259=1)
					$0:=Uppers3($1)
				Else 
					$0:=Uppers3($1; $2)
				End if 
			: ($_l_Capitalise=1)
				If (Substring:C12($1; 1; 1)#"!")
					$0:=Lowercase:C14($1)
				Else 
					$0:=$1
				End if 
				If ($_l_Option=0)
					$0:=Uppers3($0)
				Else 
					$0:=Uppers3($0; $2)
				End if 
			Else 
				$_t_ModifiedFIeldValue:=""
				RemoveLeadTr($1; ->$_t_ModifiedFIeldValue)
				$0:=Str_StripDel($_t_ModifiedFIeldValue)
		End case 
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Uppers2"; $_t_oldMethodName)
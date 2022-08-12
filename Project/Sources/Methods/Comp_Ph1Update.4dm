//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_Ph1Update
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Brackets)
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_FirstWord; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_Ph1Update")

$1:=RemoveTrail2($1)
$_l_CharPosition:=Position:C15("("; $1)
If ($_l_CharPosition>0)
	$1:=Replace string:C233($1; "("; "")
	$1:=Replace string:C233($1; ") "; " ")
	$1:=Replace string:C233($1; ")"; " ")
	$_bo_Brackets:=True:C214
Else 
	$_bo_Brackets:=False:C215
End if 

If ($1="0@")
	If ($1="010@")
		$1:="00"+Substring:C12($1; 4; 31)
	Else 
		If ($1#"01@")
			If (($1#"0800@") & ($1#"0500@") & ($1#"0345@") & ($1#"0645@") & ($1#"0321@") & ($1#"0331@") & ($1#"0336@") & ($1#"0338@") & ($1#"0447@") & ($1#"0541@") & ($1#"0632@") & ($1#"0660@") & ($1#"0696@") & ($1#"0774@") & ($1#"08364@") & ($1#"0839@") & ($1#"0881@") & ($1#"0891@") & ($1#"0894@") & ($1#"0897@") & ($1#"0898@") & ($1#"0990@"))
				If (($1#"0370@") & ($1#"0374@") & ($1#"0378@") & ($1#"0385@") & ($1#"0585@") & ($1#"0589@") & ($1#"0831@") & ($1#"0836@") & ($1#"0850@") & ($1#"0860@") & ($1#"0956@") & ($1#"0958@") & ($1#"0973@") & ($1#"0976@") & ($1#"0979@") & ($1#"0941@") & ($1#"0910@"))
					Case of 
						: ($1="0532@")
							$1:="0113 2"+RemoveLeadHyp(Substring:C12($1; 5; 31))
						: ($1="0742@")
							$1:="0114 2"+RemoveLeadHyp(Substring:C12($1; 5; 31))
						: ($1="0602@")
							$1:="0115 9"+RemoveLeadHyp(Substring:C12($1; 5; 31))
						: ($1="0533@")
							$1:="0116 2"+RemoveLeadHyp(Substring:C12($1; 5; 31))
						: ($1="0272@")
							$1:="0117 9"+RemoveLeadHyp(Substring:C12($1; 5; 31))
						Else 
							$1:="01"+Substring:C12($1; 2; 31)
					End case 
				End if 
			End if 
		End if 
	End if 
End if 

If ($_bo_Brackets)  //Put back the brackets
	$_t_FirstWord:=FirstWord($1)
	$1:="("+$_t_FirstWord+")"+Substring:C12($1; Length:C16($_t_FirstWord)+1; 31)
End if 

$0:=$1
ERR_MethodTrackerReturn("Comp_Ph1Update"; $_t_oldMethodName)
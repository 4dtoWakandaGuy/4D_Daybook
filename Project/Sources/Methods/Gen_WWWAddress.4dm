//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_WWWAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_WWWAddress")
$0:=$1
If ($0#"")
	If (Substring:C12($0; 1; 1)="!")
		$0:=Substring:C12($0; 2; Length:C16($0))
	Else 
		If ($0#"@//@")
			Case of 
				: ($0="www@")
					$0:="http://"+$0
				: (($0#"ftp@") & ($0#"http@"))
					$0:="http://www."+$0
			End case 
		End if 
	End if 
End if 
$0:=Replace string:C233(Str_SpaceDot($0); ".."; ".")
ERR_MethodTrackerReturn("Gen_WWWAddress"; $_t_oldMethodName)
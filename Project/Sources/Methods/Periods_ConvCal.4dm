//%attributes = {}
If (False:C215)
	//Project Method Name:      Periods_ConvCal
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
	C_TEXT:C284($_t_HandlerCharacter1; $_t_HandlerCharacter3; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Periods_ConvCal")
$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
$_t_HandlerCharacter3:=Substring:C12($1; 3; 1)
If ((($_t_HandlerCharacter1="7") | ($_t_HandlerCharacter1="8") | ($_t_HandlerCharacter1="9") | ($_t_HandlerCharacter1="0") | ($_t_HandlerCharacter1="A") | ($_t_HandlerCharacter1="1") | ($_t_HandlerCharacter1="B")) & ($_t_HandlerCharacter3="/"))
	Case of 
		: (($_t_HandlerCharacter1="7") | ($_t_HandlerCharacter1="8") | ($_t_HandlerCharacter1="9"))
			$0:="19"+$1
		: ($_t_HandlerCharacter1="A")
			$0:="200"+Substring:C12($1; 2; 9)
		: ($_t_HandlerCharacter1="B")
			$0:="201"+Substring:C12($1; 2; 9)
		Else 
			$0:="20"+$1
	End case 
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("Periods_ConvCal"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_CCValFr2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Year)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_CCValFr2")
//Check_CCValFr2

$1->:=Replace string:C233($1->; "."; "/")
$1->:=Replace string:C233($1->; ":"; "/")
$1->:=Replace string:C233($1->; ","; "/")
$1->:=Replace string:C233($1->; ";"; "/")
$_l_CharacterPosition:=Position:C15("/"; $1->)
If ($_l_CharacterPosition>0)
	If (Length:C16($1->)=4)
		$1->:="0"+$1->
	End if 
Else 
	If (Length:C16($1->)=3)
		$1->:="0"+Substring:C12($1->; 1; 1)+"/"+Substring:C12($1->; 2; 3)
	Else 
		If (Length:C16($1->)=4)
			$1->:=Substring:C12($1->; 1; 2)+"/"+Substring:C12($1->; 3; 3)
		End if 
	End if 
End if 
$_l_CharacterPosition:=Num:C11(Substring:C12($1->; 1; 2))
$_l_Year:=Num:C11(Substring:C12($1->; 4; 2))
If ($_l_Year<50)
	$_l_Year:=2000+$_l_Year
Else 
	$_l_Year:=1900+$_l_Year
End if 
If ((($_l_CharacterPosition>Month of:C24(<>DB_d_CurrentDate)) & ($_l_Year=Year of:C25(<>DB_d_CurrentDate))) | ($_l_Year>Year of:C25(<>DB_d_CurrentDate)))
	$0:=False:C215
	OK:=0
Else 
	$0:=True:C214
	OK:=1
End if 
ERR_MethodTrackerReturn("Check_CCValFr2"; $_t_oldMethodName)
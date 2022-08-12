//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SEND TO FILE
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
	C_BOOLEAN:C305($3; $EndOfLine)
	C_TEXT:C284($_t_oldMethodName; $2)
	C_TIME:C306($1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SEND TO FILE")
//If (False)

If (Count parameters:C259>2)
	$EndOfLine:=$3
Else 
	$EndOfLine:=False:C215
End if 

$2:=Replace string:C233($2; Char:C90(Carriage return:K15:38); "")
$2:=Replace string:C233($2; Char:C90(Tab:K15:37); "")
$2:=Replace string:C233($2; Char:C90(Line feed:K15:40); "")

If ($EndOfLine)
	SEND PACKET:C103($1; $2+Char:C90(Carriage return:K15:38))
Else 
	SEND PACKET:C103($1; $2+Char:C90(Tab:K15:37))
End if 
//End if
ERR_MethodTrackerReturn("SEND TO FILE"; $_t_oldMethodName)
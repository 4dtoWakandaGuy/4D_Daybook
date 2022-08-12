//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Play Word
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Play Word")
If ($1<9)
	PLAY:C290("Key "+String:C10($1); 0)
Else 
	Case of 
		: ($1=9)
			PLAY:C290("Key 5"; 0)
			PLAY:C290("Key 4"; 0)
		: ($1=10)
			PLAY:C290("Key 7"; 0)
			PLAY:C290("Key 3"; 0)
		: ($1=11)
			PLAY:C290("Key 6"; 0)
			PLAY:C290("Key 5"; 0)
		: ($1=12)
			PLAY:C290("Key 8"; 0)
			PLAY:C290("Key 4"; 0)
		Else 
			PLAY:C290("Key 8"; 0)
			PLAY:C290("Key 4"; 0)
			//$p:=13
			//While ($p<=$1)
			//IDLE  // 7/04/03 pb
			//PLAY("Key 1";0)
			//$p:=$p+1
			//End while 
	End case 
End if 
ERR_MethodTrackerReturn("Play Word"; $_t_oldMethodName)

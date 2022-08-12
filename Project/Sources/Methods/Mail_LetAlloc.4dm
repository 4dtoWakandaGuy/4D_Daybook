//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_LetAlloc
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
	C_LONGINT:C283(ch0; cLetters; cMerged; rDiary)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_LetAlloc")
If ((cLetters=0) & (cMerged=0) & (ch0=1))
	If (rDiary=1)
		Letter_AllocD($1)
	Else 
		Letter_Alloc($1)
	End if 
End if 
ERR_MethodTrackerReturn("Mail_LetAlloc"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Tel_PlayGetDTMF
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
	C_LONGINT:C283($_l_Index; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tel_PlayGetDTMF")
//tm_TryAndGet _Tel TTryAndGet - renamed Tel_PlayGetDTMF
//this routine plays file number $1 and tries to get $3 dtmf digits within $2
//seconds for $4 tries. If it is successful it returns the dtmfs in $0
$0:=""
$_l_Index:=0
Repeat 
	Tel_PlayAbort($1; $2)  //play the specified file
	$0:=Tel_GetDTMF($2; $3)  //get the dtmf digits
	$_l_Index:=$_l_Index+1
Until (($_l_Index>=$4) | ($0#""))
ERR_MethodTrackerReturn("Tel_PlayGetDTMF"; $_t_oldMethodName)

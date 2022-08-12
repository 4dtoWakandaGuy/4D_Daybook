//%attributes = {}
If (False:C215)
	//Project Method Name:      SER_GetDatafileSize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/09/2009 08:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_After; 0)
	ARRAY TEXT:C222($_at_Before; 0)
	C_BOOLEAN:C305($b_segmentaddedOK)
	C_LONGINT:C283($_l_ApplicationType; $_l_ExecutionCode; $_l_NumberofSegments; $1)
	C_REAL:C285($_r_currentdatasegsize; $_r_maxsegmentsize)
	C_TEXT:C284($_t_currentdataseg; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SER_GetDatafileSize")

If (Count parameters:C259>0)
	$_l_ExecutionCode:=$1
Else 
	$_l_ExecutionCode:=0
End if 
//check if data file is big enough to add segment
ARRAY TEXT:C222($_at_Before; 0)
ARRAY TEXT:C222($_at_After; 0)
//_O_DATA SEGMENT LIST($_at_Before)

$_l_NumberofSegments:=Size of array:C274($_at_Before)
If ($_l_NumberofSegments>0)
	
	$_t_currentdataseg:=$_at_Before{$_l_NumberofSegments}
	If (Test path name:C476($_t_currentdataseg)=Is a document:K24:1)
		//$_r_currentdatasegsize:=Get document size($_t_currentdataseg)
		//$_r_maxsegmentsize:=1740000*1024000*1024000*10000000
		If (False:C215)
			
		Else 
			ALERT:C41("Datafile size is "+String:C10($_r_currentdatasegsize))
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SER_GetDatafileSize"; $_t_oldMethodName)

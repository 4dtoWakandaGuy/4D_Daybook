//%attributes = {}
If (False:C215)
	//Project Method Name:      RemoveLeadTr
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
	C_LONGINT:C283($l; $t)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RemoveLeadTr")
If (Count parameters:C259>=2)
	If (Not:C34(Is nil pointer:C315($2)))
		
		$l:=1
		While (Substring:C12($1; $l; 1)=" ") | (Character code:C91(Substring:C12($1; $l; 1))=9)
			
			IDLE:C311  // 7/04/03 pb
			$l:=$l+1
		End while 
		$t:=Length:C16($1)
		While ((Substring:C12($1; $t; 1)=" ") & ($t>0))
			IDLE:C311  // 7/04/03 pb
			$t:=$t-1
		End while 
		$2->:=Substring:C12($1; $l; $t-$l+1)
	End if 
Else 
	$l:=1
	While (Substring:C12($1; $l; 1)=" ")
		IDLE:C311  // 7/04/03 pb
		$l:=$l+1
	End while 
	$t:=Length:C16($1)
	While ((Substring:C12($1; $t; 1)=" ") & ($t>0))
		IDLE:C311  // 7/04/03 pb
		$t:=$t-1
	End while 
	$0:=Substring:C12($1; $l; $t-$l+1)
End if 
ERR_MethodTrackerReturn("RemoveLeadTr"; $_t_oldMethodName)
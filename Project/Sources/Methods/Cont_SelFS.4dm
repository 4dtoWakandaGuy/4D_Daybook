//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_SelFS
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
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_ForeName; $_t_oldMethodName; $_t_Surname; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelFS")
QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$1)
If (Records in selection:C76([CONTACTS:1])=0)
	QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$1)
	If (Records in selection:C76([CONTACTS:1])=0)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$1)
		If (($1="@ @") | ($1="@,@"))
			$_l_CharPosition:=Position:C15(","; $1)
			If ($_l_CharPosition>0)
				$_t_Surname:=Substring:C12($1; 1; $_l_CharPosition-1)
				$_t_ForeName:=RemoveLead(Substring:C12($1; $_l_CharPosition+1; 32000))
			Else 
				$_l_CharPosition:=Position:C15(" "; $1)
				$_t_ForeName:=Substring:C12($1; 1; $_l_CharPosition-1)
				$_t_Surname:=RemoveLead(Substring:C12($1; $_l_CharPosition+1; 32000))
			End if 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_ForeName; *)
			QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Cont_SelFS"; $_t_oldMethodName)
//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_CheckCont
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
	C_LONGINT:C283($i; vCM; vCT)
	C_TEXT:C284($_t_oldMethodName; $t1; $t2; $t3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_CheckCont")
$i:=0
If ((vCM=0) | (vCT=0))
	FIRST RECORD:C50([CONTACTS:1])
	While (Not:C34(End selection:C36([CONTACTS:1])))
		If (([CONTACTS:1]Forename:4="") & ([CONTACTS:1]Surname:5="") & ([CONTACTS:1]Job_Title:6="") & ([CONTACTS:1]Dept:8="") & ([CONTACTS:1]Extn:9="") & ([CONTACTS:1]Mobile:12=""))
			$i:=$i+1
		End if 
		NEXT RECORD:C51([CONTACTS:1])
	End while 
	If ($i>0)
		If ($i=1)
			$t1:="There is "
			$t2:="Contact"
			$t3:="it"
		Else 
			$t1:="There are "
			$t2:="Contacts"
			$t3:="them"
		End if 
		Gen_Confirm($t1+String:C10($i)+" 'blank' "+$t2+" allocated to this Company."+Char:C90(13)+Char:C90(13)+"Do you want to delete "+$t3+"?"; "Yes"; "No")
		If (OK=1)
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Forename:4=""; *)
			QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=""; *)
			QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Job_Title:6=""; *)
			QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Dept:8=""; *)
			QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Extn:9=""; *)
			QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Mobile:12="")
			DELETE SELECTION:C66([CONTACTS:1])
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Comp_CheckCont"; $_t_oldMethodName)
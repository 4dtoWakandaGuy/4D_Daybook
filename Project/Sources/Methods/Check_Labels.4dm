//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Labels
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
	C_LONGINT:C283($i; rComp; vNo; zComp)
	C_REAL:C285(vT1; vT2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Labels")
//Check_Labels
If ((vT2=1) | (vT1=1))
	If ((rComp=0) & (zComp=1))
		Gen_Confirm("Insert Labels Sheet(s) in the Cassette, or feed manually"; ""; "")
	Else 
		$i:=Int:C8(vNo/14)
		If ($i#(vNo/14))
			$i:=$i+1
		End if 
		Gen_Confirm("Insert "+String:C10($i)+" Labels Sheet(s) in the Cassette"; ""; "")
	End if 
End if 
ERR_MethodTrackerReturn("Check_Labels"; $_t_oldMethodName)
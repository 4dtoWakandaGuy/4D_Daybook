//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters_InSWTyp
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
	C_LONGINT:C283(r1; r2; r3; r4)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_InSWTyp")
Case of 
	: (r1=1)
		$0:="Letter"
	: (r2=1)
		$0:="Quotation"
	: (r3=1)
		$0:="Fax"
	: (r4=1)
		$0:="Memo"
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("Letters_InSWTyp"; $_t_oldMethodName)
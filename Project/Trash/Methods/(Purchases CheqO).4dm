//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_CheqO
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
	C_LONGINT:C283(vSNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_CheqO")
vSNo:=0
While ((vSNo=0) & (OK=1))
	vSNo:=Num:C11(Gen_Request(Term_SLPLWT("Please specify the first Cheque No to be printed:"); ""; "OK"; "None"))
	If (OK=0)
		vSNo:=0
	End if 
End while 
ERR_MethodTrackerReturn("Purchases_CheqO"; $_t_oldMethodName)
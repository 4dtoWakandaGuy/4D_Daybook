//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_ImpStrip
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vT; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ImpStrip")
vT:=vText
If (Character code:C91(Substring:C12(vT; 1; 1))=10)
	vT:=Substring:C12(vT; 2; 32000)
End if 
ERR_MethodTrackerReturn("Gen_ImpStrip"; $_t_oldMethodName)
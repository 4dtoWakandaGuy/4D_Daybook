If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Button2"; Form event code:C388)


//POST KEY(-101;Shift key mask +Control key mask +Option key mask )

POST KEY:C465(-101; Shift key mask:K16:3+Control key mask:K16:9+Option key mask:K16:7; 1)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.Button2"; $_t_oldMethodName)
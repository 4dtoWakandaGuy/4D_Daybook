//%attributes = {}
If (False:C215)
	//Project Method Name:      QA_Open
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_Error; $2; QA_l_Return)
	C_TEXT:C284($_t_oldMethodName; $1; QA_t_Return; vSubGroup1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QA_Open")

If (Is Windows:C1573)
	QA_l_Return:=0
	PLUGCALL_QuickAddress("RapidAddrOpen"; 0; ->QA_l_Return)
	If ($_l_Error=0)
		$0:=True:C214
	Else 
		PLUGCALL_QuickAddress("err"; $2; ->vSubGroup1)
		Gen_Alert("QuickAddress Open failure: "+vSubGroup1)
		$0:=False:C215
	End if 
Else 
	QA_l_Return:=0
	PLUGCALL_QuickAddress("Open"; 0; ->QA_l_Return)
	$_l_Error:=QA_l_Return
	If ($_l_Error=0)
		$0:=True:C214
	Else 
		QA_t_Return:=""
		PLUGCALL_QuickAddress("err2"; 0; ->QA_t_Return)
		Gen_Alert("QuickAddress Open failure: "+QA_t_Return)
		$0:=False:C215
	End if 
End if 
ERR_MethodTrackerReturn("QA_Open"; $_t_oldMethodName)

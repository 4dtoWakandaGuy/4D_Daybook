//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary New
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>NoStart; vNo)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary New")
If (DB_t_CurrentFormUsage="InL")
	//  If ((◊Write="WS") | (◊Write="SW"))  ` 4DWrite "Silver" or SuperWrite
	
	Gen_Confirm("Create a Letter or a Quotation?"; "Letter"; "Quote")
	<>NoStart:=1
	If (OK=1)
		Diary_InL
	Else 
		DB_MenuNewRecord("DiaryQuotations")
		//Diary_InQ
	End if 
	
	DB_t_CurrentFormUsage:="InL"
Else 
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	DB_t_CurrentFormUsage:="Diary"
	<>NoStart:=1
	Diary_In
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
End if 
USE SET:C118("DMaster")
vNo:=Records in selection:C76
ERR_MethodTrackerReturn("Diary New"; $_t_oldMethodName)
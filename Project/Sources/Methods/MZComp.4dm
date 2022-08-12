//%attributes = {}
If (False:C215)
	//Project Method Name:      MZComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(zComp)
	C_TEXT:C284($_t_CompositeName; $_t_oldMethodName; vCompCode; VDetails)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MZComp")
//MZComp
If (False:C215)
	vCompCode:=[COMPANIES:2]Company_Code:1
	NEXT RECORD:C51([CONTACTS:1])
	Mail_MSRec
	MContComp_Calc
	While ((zComp=1) & (Not:C34(End selection:C36([COMPANIES:2]))) & ([COMPANIES:2]Company_Code:1=vCompCode))
		vCompCode:=[COMPANIES:2]Company_Code:1
		NEXT RECORD:C51([CONTACTS:1])
		MContComp_Calc
	End while 
	$_t_CompositeName:=[COMPANIES:2]Company_Name:2+[CONTACTS:1]Contact_Name:31+VCompCode
End if 

vCompCode:=[COMPANIES:2]Company_Code:1
NEXT RECORD:C51([CONTACTS:1])

$_t_CompositeName:=Char:C90(13)+[COMPANIES:2]Company_Name:2+[CONTACTS:1]Contact_Name:31+VCompCode
Mail_MSRec
$_t_CompositeName:=$_t_CompositeName+Char:C90(13)+[COMPANIES:2]Company_Name:2+[CONTACTS:1]Contact_Name:31+VCompCode

MContComp_Calc
$_t_CompositeName:=$_t_CompositeName+Char:C90(13)+[COMPANIES:2]Company_Name:2+[CONTACTS:1]Contact_Name:31+VCompCode
If (False:C215)
	While ((zComp=1) & (Not:C34(End selection:C36)) & ([COMPANIES:2]Company_Code:1=vCompCode))
		$_t_CompositeName:=$_t_CompositeName+Char:C90(13)+[COMPANIES:2]Company_Name:2+[CONTACTS:1]Contact_Name:31+VCompCode
		
		
		vCompCode:=[COMPANIES:2]Company_Code:1
		NEXT RECORD:C51([CONTACTS:1])
		$_t_CompositeName:=$_t_CompositeName+Char:C90(13)+[COMPANIES:2]Company_Name:2+[CONTACTS:1]Contact_Name:31+VCompCode
		
		MContComp_Calc
		$_t_CompositeName:=$_t_CompositeName+Char:C90(13)+[COMPANIES:2]Company_Name:2+[CONTACTS:1]Contact_Name:31+VCompCode
		
	End while 
	VDetails:=$_t_CompositeName
End if 
ERR_MethodTrackerReturn("MZComp"; $_t_oldMethodName)

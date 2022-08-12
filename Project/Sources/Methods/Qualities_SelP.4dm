//%attributes = {}
If (False:C215)
	//Project Method Name:      Qualities_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2009 06:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(VA)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qualities_SelP")
//CREATE EMPTY SET([APPLICANTS];"QVTEMP") ` NG This assumes Applicants and that is wrong.. h
CREATE EMPTY SET:C140([INFORMATION:55]; "QVRecords")
//QV_AdvancedSearch (Table(->[APPLICANTS]);True)
//this returns a set
USE SET:C118("QVRecords")
CLEAR SET:C117("QVRecords")
If (Records in selection:C76([INFORMATION:55])>0)
	
	
Else 
	VA:=0
	
End if 
ERR_MethodTrackerReturn("Qualities_SelP"; $_t_oldMethodName)
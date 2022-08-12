//%attributes = {}
If (False:C215)
	//Project Method Name:      Qual_Code
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
	C_LONGINT:C283($_l_Clash)
	C_TEXT:C284($_t_InformationCode; $_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Qual_Code")

Repeat 
	$_t_InformationCode:=String:C10(AA_GetNextIDinMethod(->[INFORMATION:55]Information_Code:9; Sequence number:C244([INFORMATION:55])))
	SET QUERY DESTINATION:C396(3; $_l_Clash)
	QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Code:9=$_t_InformationCode)
	SET QUERY DESTINATION:C396(0)
	
Until ($_l_Clash=0)
If (Count parameters:C259=0)
	[INFORMATION:55]Information_Code:9:=$_t_InformationCode
Else 
	$0:=$_t_InformationCode
End if 
ERR_MethodTrackerReturn("Qual_Code"; $_t_oldMethodName)

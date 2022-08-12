If (False:C215)
	//object Name: [WEBSETUP_4D]IPRanges.Variable1
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
	//ARRAY TEXT(<>IWS_at_OldIPRange;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_IWSRangeIndex)
	C_TEXT:C284(<>IWS_t_IPRanges; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].IPRanges.Variable1"; Form event code:C388)
If (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	ARRAY TEXT:C222(<>IWS_at_OldIPRange; 0)
	LIST TO ARRAY:C288("Valid IP Ranges"; <>IWS_at_OldIPRange)
	<>IWS_t_IPRanges:=""
	For ($_l_IWSRangeIndex; 1; Size of array:C274(<>IWS_at_OldIPRange))
		<>IWS_t_IPRanges:=<>IWS_t_IPRanges+<>IWS_at_OldIPRange{$_l_IWSRangeIndex}
		If ($_l_IWSRangeIndex<Size of array:C274(<>IWS_at_OldIPRange))
			<>IWS_t_IPRanges:=<>IWS_t_IPRanges+Char:C90(13)
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].IPRanges.Variable1"; $_t_oldMethodName)
